import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/rest_client/common_rest_client.dart';
import '../../authentication.dart';

part 'auth_session_bloc.freezed.dart';
part 'auth_session_event.dart';
part 'auth_session_state.dart';

class AuthSessionBloc extends Bloc<AuthSessionEvent, AuthSessionState> {
  AuthSessionBloc({required this._repository}) : super(Initial()) {
    on<AuthSessionEvent>(
      (event, emit) => event.map(
        createChallenge: (e) => _onCreateChallenge(e, emit),
        verifyCode: (e) => _onVerifyCode(e, emit),
        resendCode: (e) => _onResendCode(e, emit),
      ),
      transformer: droppable(),
    );
  }
  final IAuthenticationRepository _repository;

  OtpChallenge? _challenge;
  String? _phone;
  bool? _personalDataConsent;

  Future<void> _onCreateChallenge(
    CreateChallenge event,
    Emitter<AuthSessionState> emit,
  ) async {
    emit(const AuthSessionState.loading());

    try {
      final requestId = const Uuid().v4();
      final challenge = await _repository.createChallenge(
        phone: event.phone,
        personalDataConsent: event.personalDataConsent,
        requestId: requestId,
      );
      _challenge = challenge;
      _phone = event.phone;
      _personalDataConsent = event.personalDataConsent;
      emit(
        AuthSessionState.challengeCreated(
          requestId: requestId,
          challenge: challenge,
        ),
      );
    } on OtpRateLimitException catch (e) {
      emit(
        AuthSessionState.rateLimited(
          retryAfter: Duration(seconds: e.retryAfterSeconds),
          blockedUntil: e.blockedUntil,
        ),
      );
    } on Object catch (e, st) {
      emit(AuthSessionState.failed(error: e.toString(), stackTrace: st));
    }
  }

  Future<void> _onVerifyCode(
    VerifyCode event,
    Emitter<AuthSessionState> emit,
  ) async {
    final challenge = _challenge;

    if (challenge == null) {
      emit(
        AuthSessionState.failed(
          error: 'Challenge is not created',
          stackTrace: StackTrace.current,
        ),
      );
      return;
    }

    emit(const AuthSessionState.loading());
    try {
      final session = await _repository.verifyCode(
        challengeId: challenge.challengeId,
        code: event.code,
      );

      _challenge = null;
      emit(AuthSessionState.authenticated(session: session));
    } on OtpRateLimitException catch (e) {
      if (e.code == .otpAttemptsExceeded) _challenge = null;

      emit(
        AuthSessionState.rateLimited(
          retryAfter: Duration(seconds: e.retryAfterSeconds),
          blockedUntil: e.blockedUntil,
        ),
      );
    } on OtpWrongCodeException catch (e) {
      emit(
        AuthSessionState.invalidCode(
          attemptsRemaining: e.attemptsRemaining,
          retryAfter: Duration(seconds: e.retryAfterSeconds),
        ),
      );
    } on Object catch (e, st) {
      emit(AuthSessionState.failed(error: e.toString(), stackTrace: st));
    }
  }

  Future<void> _onResendCode(
    ResendCode event,
    Emitter<AuthSessionState> emit,
  ) async {
    try {
      add(
        AuthSessionEvent.createChallenge(
          phone: _phone!,
          personalDataConsent: _personalDataConsent!,
        ),
      );
    } on Object catch (e, st) {
      emit(AuthSessionState.failed(error: e.toString(), stackTrace: st));
    }
  }
}
