import 'package:diploma/app/feature/authentication/app/contracts/i_refresh_token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RefreshTokenStorage implements IRefreshTokenStorage {
  RefreshTokenStorage({required this._storage});
  final FlutterSecureStorage _storage;

  static const _refreshTokenKey = 'refresh_token';
  String? _accessToken;

  @override
  String? get accessToken => _accessToken;

  @override
  Future<void> clear() async {
    _accessToken = null;
    await _storage.delete(key: _refreshTokenKey);
  }

  @override
  Future<String?> read() {
    return _storage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> save({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
    _accessToken = accessToken;
  }
}
