import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticated_response.freezed.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

enum TokenType { bearer, unknown }

@Freezed(toStringOverride: false)
abstract class AuthenticatedResponse with _$AuthenticatedResponse {
  const AuthenticatedResponse._();

  const factory AuthenticatedResponse({
    required AuthStatus authStatus,
    required String accessToken,
    required String refreshToken,
    required TokenType tokenType,
    required int accessExpiresIn,
    required int refreshExpiresIn,
  }) = _AuthenticatedResponse;
}
