sealed class RestClientException implements Exception {
  const RestClientException({required this.message, this.statusCode});
  final String message;
  final int? statusCode;
}

final class ApiException extends RestClientException {
  const ApiException({
    required this.code,
    super.message = 'API request failed',
    super.statusCode,
    this.details,
    this.requestId,
  });

  final String code;
  final Map<String, dynamic>? details;
  final String? requestId;

  @override
  String toString() =>
      'ApiException('
      'code: $code, '
      'statusCode: $statusCode, '
      'message: $message, '
      'details: $details, '
      'requestId: $requestId)';
}

enum OtpRateLimitCode {
  otpResendTooEarly,
  otpAttemptsExceeded,
  otpWrongCode,
  unknown,
}

class OtpWrongCodeException extends RestClientException {
  OtpWrongCodeException({
    super.message = 'OTP resend is temporarily unavailable',
    super.statusCode = 400,
    this.requestId,
    required this.retryAfterSeconds,
    required this.resendAvailableAt,
    required this.attemptsRemaining,
    required this.serverTime,
  });

  factory OtpWrongCodeException.fromApi(ApiException e) {
    final d = e.details ?? const {};
    DateTime date(String key) => DateTime.parse(d[key] as String);

    return OtpWrongCodeException(
      message: e.message,
      statusCode: e.statusCode,
      requestId: e.requestId,
      retryAfterSeconds: d['retry_after_seconds'] as int,
      resendAvailableAt: date('resend_available_at'),
      attemptsRemaining: d['attempts_remaining'] as int,
      serverTime: DateTime.parse(d['server_time'] as String),
    );
  }

  final String? requestId;
  final int retryAfterSeconds;
  final DateTime resendAvailableAt;
  final int attemptsRemaining;
  final DateTime serverTime;

  @override
  String toString() =>
      'OtpWrongCodeException('
      'message: $message,'
      'statusCode: $statusCode,'
      'requestId: $requestId,'
      'retryAfterSeconds: $retryAfterSeconds,'
      'resendAvailableAt: $resendAvailableAt,'
      'attemptsRemaining: $attemptsRemaining,'
      'serverTime: $serverTime)';
}

class OtpRateLimitException extends RestClientException {
  OtpRateLimitException({
    super.message = 'OTP resend is temporarily unavailable',
    super.statusCode = 429,
    this.requestId,
    required String code,
    required this.retryAfterSeconds,
    this.blockedUntil,
    required this.serverTime,
  }) : code = switch (code) {
         'otp_resend_too_early' => .otpResendTooEarly,
         'otp_attempts_exceeded' => .otpAttemptsExceeded,
         _ => .unknown,
       };

  factory OtpRateLimitException.fromApi(ApiException e) {
    final d = e.details ?? const {};
    DateTime? date(String key) =>
        d[key] is String ? DateTime.parse(d[key] as String) : null;

    return OtpRateLimitException(
      message: e.message,
      statusCode: e.statusCode,
      requestId: e.requestId,
      code: e.code,
      retryAfterSeconds: d['retry_after_seconds'] as int,
      blockedUntil: date('blocked_until'),
      serverTime: DateTime.parse(d['server_time'] as String),
    );
  }

  final String? requestId;
  final OtpRateLimitCode code;
  final int retryAfterSeconds;
  final DateTime? blockedUntil;
  final DateTime serverTime;

  @override
  String toString() =>
      'OtpRateLimitException('
      'message: $message,'
      'statusCode: $statusCode,'
      'requestId: $requestId,'
      'code: $code,'
      'retryAfterSeconds: $retryAfterSeconds,'
      'blockedUntil: $blockedUntil,'
      'serverTime: $serverTime)';
}

class NetworkException extends RestClientException {
  const NetworkException({required super.message, super.statusCode = 500});

  @override
  String toString() =>
      'NetworkException(message: $message, statusCode: $statusCode)';
}

class RevokeTokenException extends RestClientException {
  const RevokeTokenException({super.message = 'Token is invalid or expired'});

  @override
  String toString() => 'RevokeTokenException(message: $message)';
}

final class UnexpectedResponseException extends RestClientException {
  const UnexpectedResponseException({super.statusCode, this.cause})
    : super(message: 'Unexpected response format');

  final Object? cause;

  @override
  String toString() =>
      'UnexpectedResponseException(statusCode: $statusCode, cause: $cause)';
}
