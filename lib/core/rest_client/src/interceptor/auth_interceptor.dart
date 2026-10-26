import 'rest_client_interceptor.dart';

final class AuthInterceptor extends BaseInterceptor {
  AuthInterceptor(this._onLoadToken);
  final Future<String> Function() _onLoadToken;

  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) {
    return _onLoadToken().then(
      (token) => request.copyWith(
        headers: {...request.headers, 'Authorization': 'Bearer $token'},
      ),
    );
  }
}
