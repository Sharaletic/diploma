class RestClientRequest {
  const RestClientRequest({
    required this.uri,
    required this.method,
    this.body,
    this.headers = const {},
  });

  final Uri uri;
  final String method;
  final Map<String, Object?>? body;
  final Map<String, String> headers;

  RestClientRequest copyWith({
    Uri? uri,
    String? method,
    Map<String, Object?>? body,
    Map<String, String>? headers,
  }) {
    return RestClientRequest(
      uri: uri ?? this.uri,
      method: method ?? this.method,
      body: body ?? this.body,
      headers: headers ?? this.headers,
    );
  }

  @override
  String toString() => 'RestClientRequest(method: $method, uri: $uri)';
}

class RestClientResponse {
  const RestClientResponse({
    required this.statusCode,
    required this.data,
    required this.request,
    required this.headers,
  });

  final int statusCode;
  final Map<String, Object?> data;
  final RestClientRequest request;
  final Map<String, String>? headers;

  RestClientResponse copyWith({
    int? statusCode,
    Map<String, Object?>? data,
    RestClientRequest? request,
    Map<String, String>? headers,
  }) {
    return RestClientResponse(
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
      request: request ?? this.request,
      headers: headers ?? this.headers,
    );
  }

  @override
  String toString() =>
      'RestClientResponse(statusCode: $statusCode, request: $request, headers: $headers)';
}

abstract interface class RestClientInterceptor {
  Future<RestClientRequest> onRequest(RestClientRequest request);

  Future<RestClientResponse> onResponse(RestClientResponse response);

  Future<RestClientResponse> onError(
    Object error,
    StackTrace stackTrace,
    RestClientRequest request,
  );
}

abstract class BaseInterceptor implements RestClientInterceptor {
  const BaseInterceptor();

  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async =>
      request;

  @override
  Future<RestClientResponse> onResponse(RestClientResponse response) async =>
      response;

  @override
  Future<RestClientResponse> onError(
    Object error,
    StackTrace stackTrace,
    RestClientRequest request,
  ) async {
    Error.throwWithStackTrace(error, stackTrace);
  }
}
