part of 'auth_session_bloc.dart';

@freezed
sealed class AuthSessionState with _$AuthSessionState {
  const factory AuthSessionState.initial() = Initial;

  const factory AuthSessionState.challengeCreated({
    required String requestId,
    required OtpChallenge challenge,
  }) = ChallengeCreated;

  const factory AuthSessionState.invalidCode({
    required int attemptsRemaining,
    required Duration retryAfter,
  }) = InvalidCode;

  const factory AuthSessionState.rateLimited({required Duration retryAfter}) =
      RateLimited;

  const factory AuthSessionState.attemptsExceeded({
    required Duration retryAfter,
    required DateTime? blockedUntil,
  }) = AttemptsExceeded;

  const factory AuthSessionState.authenticated({
    required AuthenticatedResponse session,
  }) = Authenticated;

  const factory AuthSessionState.failed({
    required String error,
    required StackTrace stackTrace,
  }) = Failed;

  const factory AuthSessionState.loading() = Loading;
}
