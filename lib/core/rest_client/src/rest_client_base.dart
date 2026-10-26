import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'exceptions/rest_client_exceptions.dart';
import 'interceptor/rest_client_interceptor.dart';
import 'rest_client.dart';
import 'package:path/path.dart' as p;

abstract base class RestClientBase implements RestClient {
  RestClientBase({
    required String baseUrl,
    List<RestClientInterceptor>? interceptors,
  }) : baseUri = Uri.parse(baseUrl),
       _interceptors = interceptors ?? const [];

  final Uri baseUri;
  final List<RestClientInterceptor> _interceptors;

  static final _jsonUTF8 = json.fuse(utf8);

  @protected
  Future<RestClientResponse> sendRequest(RestClientRequest request);

  Future<Map<String, Object?>> send({
    required String path,
    required String method,
    Map<String, Object?>? body,
    Map<String, String>? headers,
    Map<String, String?>? queryParams,
  }) async {
    var request = RestClientRequest(
      uri: buildUri(path: path, queryParams: queryParams),
      method: method,
      body: body,
      headers: headers ?? {},
    );

    for (final interceptor in _interceptors) {
      request = await interceptor.onRequest(request);
    }

    try {
      var response = await sendRequest(request);

      for (final interceptor in _interceptors.reversed) {
        response = await interceptor.onResponse(response);
      }

      return response.data;
    } catch (error, stackTrace) {
      for (final interceptor in _interceptors.reversed) {
        try {
          final response = await interceptor.onError(
            error,
            stackTrace,
            request,
          );
          return response.data;
        } catch (newError, newStackTrace) {
          if (identical(newError, error)) continue;
          Error.throwWithStackTrace(newError, newStackTrace);
        }
      }
      rethrow;
    }
  }

  @override
  Future<Map<String, Object?>> get(
    String path, {
    Map<String, String>? headers,
    Map<String, String?>? queryParams,
  }) => send(
    path: path,
    method: 'GET',
    headers: headers,
    queryParams: queryParams,
  );

  @override
  Future<Map<String, Object?>> post(
    String path, {
    required Map<String, Object?> body,
    Map<String, String>? headers,
    Map<String, String?>? queryParams,
  }) => send(
    path: path,
    method: 'POST',
    body: body,
    headers: headers,
    queryParams: queryParams,
  );

  @override
  Future<Map<String, Object?>> put(
    String path, {
    required Map<String, Object?> body,
    Map<String, String>? headers,
    Map<String, String?>? queryParams,
  }) => send(
    path: path,
    method: 'PUT',
    body: body,
    headers: headers,
    queryParams: queryParams,
  );

  @override
  Future<Map<String, Object?>> delete(
    String path, {
    Map<String, String>? headers,
    Map<String, String?>? queryParams,
  }) => send(
    path: path,
    method: 'DELETE',
    headers: headers,
    queryParams: queryParams,
  );

  @override
  Future<Map<String, Object?>> patch(
    String path, {
    required Map<String, Object?> body,
    Map<String, String>? headers,
    Map<String, String?>? queryParams,
  }) => send(
    path: path,
    method: 'PATCH',
    body: body,
    headers: headers,
    queryParams: queryParams,
  );

  @protected
  List<int> encodeBody(Map<String, Object?> body) => _jsonUTF8.encode(body);

  Uri buildUri({required String path, Map<String, Object?>? queryParams}) {
    final finalPath = p.canonicalize(p.join(baseUri.path, path));
    return baseUri.replace(
      path: finalPath,
      queryParameters: {...baseUri.queryParameters, ...?queryParams},
    );
  }

  Future<Map<String, Object?>> decodeResponse(
    List<int> body, {
    required int statusCode,
  }) async {
    try {
      if (body.isEmpty) return {};

      if (body.length > 1024 * 32) {
        final decodedJson = await compute(
          _jsonUTF8.decode,
          body,
          debugLabel: kDebugMode ? 'Decode Bytes Compute' : null,
        );

        return decodedJson as Map<String, Object?>;
      }

      return _jsonUTF8.decode(body)! as Map<String, Object?>;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        UnexpectedResponseException(statusCode: statusCode, cause: e),
        stackTrace,
      );
    }
  }
}
