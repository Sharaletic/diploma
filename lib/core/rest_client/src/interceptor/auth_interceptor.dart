import 'rest_client_interceptor.dart';

final class AuthInterceptor extends BaseInterceptor {
  AuthInterceptor(
    this._onLoadToken, {
    bool Function(RestClientRequest request)? shouldLoadToken,
  }) : _shouldLoadToken = shouldLoadToken ?? _alwaysLoadToken;

  final Future<String> Function() _onLoadToken;
  final bool Function(RestClientRequest request) _shouldLoadToken;

  static bool _alwaysLoadToken(RestClientRequest _) => true;

  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async {
    if (!_shouldLoadToken(request)) return request;

    final token = await _onLoadToken();
    if (token.isEmpty) return request;

    return request.copyWith(
      headers: {...request.headers, 'Authorization': 'Bearer $token'},
    );
  }
}
