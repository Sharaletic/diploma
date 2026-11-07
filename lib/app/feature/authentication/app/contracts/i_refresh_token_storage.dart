abstract interface class IRefreshTokenStorage {
  String? get accessToken;

  Future<void> save({
    required String accessToken,
    required String refreshToken,
  });

  Future<String?> read();

  Future<void> clear();
}
