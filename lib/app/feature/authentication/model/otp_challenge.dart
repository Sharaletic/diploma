import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_challenge.freezed.dart';

@freezed
abstract class OtpChallenge with _$OtpChallenge {
  const OtpChallenge._();

  const factory OtpChallenge({
    required String challengeId,
    required DateTime sentAt,
    required DateTime expiresAt,
    required DateTime resendAvailableAt,
    required DateTime serverTime,
  }) = _OtpChallenge;

  Duration get expiresIn => expiresAt.difference(serverTime);

  Duration get resendAfter => resendAvailableAt.difference(serverTime);
}
