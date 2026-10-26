import 'package:http/http.dart' as http;
import '../exceptions/rest_client_exceptions.dart';
import '../interceptor/rest_client_interceptor.dart';
import '../rest_client_base.dart';

http.Client createDefaultHttpClient() {
  return http.Client();
}

final class RestClientHTTP extends RestClientBase {
  RestClientHTTP({
    required super.baseUrl,
    required super.interceptors,
    http.Client? client,
  }) : _client = client ?? http.Client();

  final http.Client _client;

  @override
  Future<RestClientResponse> sendRequest(RestClientRequest request) async {
    try {
      final httpRequest = http.Request(request.method, request.uri);
      httpRequest.headers.addAll(request.headers);

      if (request.body != null) {
        httpRequest.bodyBytes = encodeBody(request.body!);
        httpRequest.headers['content-type'] = 'application/json;charset=utf-8';
      }

      final response = await _client
          .send(httpRequest)
          .then(http.Response.fromStream);

      final data = await decodeResponse(
        response.bodyBytes,
        statusCode: response.statusCode,
      );

      return RestClientResponse(
        statusCode: response.statusCode,
        data: data,
        request: request,
        headers: response.headers,
      );
    } on RestClientException {
      rethrow;
    } on http.ClientException catch (e, stack) {
      Error.throwWithStackTrace(NetworkException(message: e.message), stack);
    }
  }
}
