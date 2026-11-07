import '../exceptions/rest_client_exceptions.dart';
import 'rest_client_interceptor.dart';

final class BackendExceptionInterceptor extends BaseInterceptor {
  BackendExceptionInterceptor();

  @override
  Future<RestClientResponse> onResponse(RestClientResponse response) async {
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return response;
    }

    final contentType = response.headers?['content-type']?.toLowerCase() ?? '';

    if (contentType.contains('json')) {
      final data = Map.of(response.data);

      final code = data.remove('code') as String? ?? 'Unknown Code';
      final message =
          data.remove('message') as String? ??
          data.remove('title') as String? ??
          'Unknown Error';
      final status = data.remove('status') as int? ?? response.statusCode;
      final details = data.remove('details') as Map<String, dynamic>?;
      final requestId = data.remove('request_id') as String?;
      data.remove('instance');

      throw ApiException(
        code: code,
        message: message,
        statusCode: status,
        details: details,
        requestId: requestId,
      );
    }

    throw UnexpectedResponseException(
      statusCode: response.statusCode,
      cause: response.data,
    );
  }
}
