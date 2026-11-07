import '../../../../../core/rest_client/common_rest_client.dart';
import '../../authentication.dart';

abstract interface class IAuthenticationRepository {
  Future<OtpChallenge> createChallenge({
    required String phone,
    required bool personalDataConsent,
    required String requestId,
  });

  Future<AuthenticatedResponse> verifyCode({
    required String challengeId,
    required String code,
  });

  Future<OtpChallenge> resendCode({
    required String challengeId,
    required String requestId,
  });

  Future<AuthenticatedResponse?> refresh();

  Future<void> logout({required String accessToken});
}

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository({required this._restClient, required this._storage});

  final RestClient _restClient;
  final IRefreshTokenStorage _storage;

  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on ApiException catch (e, stackTrace) {
      final detailCode = e.details?['code'];
      final code = detailCode is String ? detailCode : e.code;

      switch (code) {
        case 'otp_wrong_code':
          Error.throwWithStackTrace(
            OtpWrongCodeException.fromApi(e),
            stackTrace,
          );
        case 'otp_attempts_exceeded' || 'otp_resend_too_early':
          Error.throwWithStackTrace(
            OtpRateLimitException.fromApi(e),
            stackTrace,
          );
      }
      rethrow;
    }
  }

  @override
  Future<OtpChallenge> createChallenge({
    required String phone,
    required bool personalDataConsent,
    required String requestId,
  }) => _guard(() async {
    final response = await _restClient.post(
      '/auth/mobile/challenges',
      body: {
        'request_id': requestId,
        'phone': phone,
        'personal_data_consent': personalDataConsent,
      },
    );

    return OtpChallengeDto.fromJson(response).toDomain();
  });

  @override
  Future<AuthenticatedResponse> verifyCode({
    required String challengeId,
    required String code,
  }) => _guard(() async {
    final response = await _restClient.post(
      '/auth/mobile/challenges/$challengeId/verify',
      body: {'code': code},
    );

    final session = AuthenticatedResponseDto.fromJson(response).toDomain();
    await _storage.save(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
    );

    return session;
  });

  @override
  Future<OtpChallenge> resendCode({
    required String challengeId,
    required String requestId,
  }) => _guard(() async {
    final response = await _restClient.post(
      '/auth/mobile/challenges/$challengeId/resend',
      body: {'request_id': requestId},
    );

    return OtpChallengeDto.fromJson(response).toDomain();
  });

  @override
  Future<AuthenticatedResponse?> refresh() async {
    final refreshToken = await _storage.read();
    if (refreshToken == null || refreshToken.isEmpty) return null;

    final response = await _restClient.post(
      '/auth/mobile/refresh',
      body: {'refresh_token': refreshToken},
    );

    final session = AuthenticatedResponseDto.fromJson(response).toDomain();
    await _storage.save(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
    );

    return session;
  }

  @override
  Future<void> logout({required String accessToken}) async {
    await _restClient.post('/auth/mobile/logout');
    await _storage.clear();
  }
}
