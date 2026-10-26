import 'package:diploma/app/feature/authentication/app/contracts/i_refresh_token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RefreshTokenStorage implements IRefreshTokenStorage {
  RefreshTokenStorage({required this._storage});

  final FlutterSecureStorage _storage;

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<String?> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> save(String refreshToken) async {
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }
}
