import '../../authentication.dart';

class AuthenticatedResponseDto {
  const AuthenticatedResponseDto({
    required this.authStatus,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.accessExpiresIn,
    required this.refreshExpiresIn,
  });
  final String authStatus;
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int accessExpiresIn;
  final int refreshExpiresIn;

  factory AuthenticatedResponseDto.fromJson(Map<String, Object?> json) {
    final authStatus = json['status'];
    final accessToken = json['access_token'];
    final refreshToken = json['refresh_token'];
    final tokenType = json['token_type'];
    final accessExpiresIn = json['access_expires_in'];
    final refreshExpiresIn = json['refresh_expires_in'];

    if (authStatus is! String ||
        accessToken is! String ||
        refreshToken is! String ||
        tokenType is! String ||
        accessExpiresIn is! int ||
        refreshExpiresIn is! int) {
      throw const FormatException('Invalid authentication response');
    }

    return AuthenticatedResponseDto(
      authStatus: authStatus,
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      accessExpiresIn: accessExpiresIn,
      refreshExpiresIn: refreshExpiresIn,
    );
  }

  AuthStatus _stringToAuthStatus(String status) =>
      switch (status.toLowerCase().trim()) {
        'authenticated' => .authenticated,
        'unauthenticated' => .unauthenticated,
        _ => .unknown,
      };

  TokenType _stringToBearer(String type) => switch (type.toLowerCase().trim()) {
    'bearer' => .bearer,
    _ => .unknown,
  };

  AuthenticatedResponse toDomain() => AuthenticatedResponse(
    authStatus: _stringToAuthStatus(authStatus),
    accessToken: accessToken,
    refreshToken: refreshToken,
    tokenType: _stringToBearer(tokenType),
    accessExpiresIn: accessExpiresIn,
    refreshExpiresIn: refreshExpiresIn,
  );
}
