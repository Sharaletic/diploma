part of 'auth_session_bloc.dart';

@freezed
sealed class AuthSessionEvent with _$AuthSessionEvent {
  const factory AuthSessionEvent.createChallenge({
    required String phone,
    required bool personalDataConsent,
  }) = CreateChallenge;

  const factory AuthSessionEvent.verifyCode({required String code}) =
      VerifyCode;

  const factory AuthSessionEvent.resendCode() = ResendCode;
}
