import '../../authentication.dart';

class OtpChallengeDto {
  const OtpChallengeDto({
    required this.challengeId,
    required this.sentAt,
    required this.expiresAt,
    required this.resendAvailableAt,
    required this.serverTime,
  });

  final String challengeId;
  final DateTime sentAt;
  final DateTime expiresAt;
  final DateTime resendAvailableAt;
  final DateTime serverTime;

  factory OtpChallengeDto.fromJson(Map<String, Object?> json) {
    final challengeId = json['challenge_id'];
    final sentAt = json['sent_at'];
    final expiresAt = json['expires_at'];
    final resendAvailableAt = json['resend_available_at'];
    final serverTime = json['server_time'];

    if (challengeId is! String ||
        challengeId.isEmpty ||
        sentAt is! String ||
        expiresAt is! String ||
        resendAvailableAt is! String ||
        serverTime is! String) {
      throw const FormatException('Invalid SMS challenge response');
    }

    return OtpChallengeDto(
      challengeId: challengeId,
      sentAt: DateTime.parse(sentAt).toUtc(),
      expiresAt: DateTime.parse(expiresAt).toUtc(),
      resendAvailableAt: DateTime.parse(resendAvailableAt).toUtc(),
      serverTime: DateTime.parse(serverTime).toUtc(),
    );
  }

  OtpChallenge toDomain() => OtpChallenge(
    challengeId: challengeId,
    sentAt: sentAt,
    expiresAt: expiresAt,
    resendAvailableAt: resendAvailableAt,
    serverTime: serverTime,
  );
}
