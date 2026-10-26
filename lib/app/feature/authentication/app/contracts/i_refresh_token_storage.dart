abstract interface class IRefreshTokenStorage {
  Future<void> save(String refreshToken);

  Future<String?> read();

  Future<void> clear();
}
