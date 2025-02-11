import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/web.dart';

class ApiService {
  final http.Client _client;
  final Logger _logger;
  final int timeoutInSeconds = 10;

  ApiService(this._logger) : _client = http.Client();

  Future<http.Response> post(
    String path, {
    bool withInterceptor = true,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final finalHeaders = _prepareHeaders(headers, withInterceptor, 'POST');

    _logger.d('POST Request: $uri\nHeaders: $finalHeaders\nBody: $data');
    final response = await _client.post(
      uri,
      headers: finalHeaders,
      body: data != null ? json.encode(data) : null,
    );
    _logger.d('POST Response: ${response.statusCode}\n${response.body}');
    return response;
  }

  Future<http.Response> get(
    String path, {
    bool withInterceptor = true,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final finalHeaders = _prepareHeaders(headers, withInterceptor, 'GET');

    _logger.d('GET Request: $uri\nHeaders: $finalHeaders');
    final response = await _client.get(uri);
    _logger.d('GET Response: ${response.statusCode}\n${response.body}');
    return response;
  }

  Uri _buildUri(String path, Map<String, dynamic>? queryParameters) {
    return Uri.parse(path).replace(
      queryParameters: queryParameters?.map((key, value) => MapEntry(key, value.toString())),
    );
  }

  Map<String, String> _prepareHeaders(
    Map<String, String>? headers,
    bool withInterceptor,
    String method,
  ) {
    final headersMap = headers ?? {};

    // Adiciona headers comuns
    headersMap['Accept'] = 'application/json';

    // Content-Type apenas para métodos que enviam body
    if (method != 'GET' && method != 'DELETE') {
      headersMap['Content-Type'] = 'application/json';
    }

    // Adicionar interceptor aqui se necessário (ex: token)
    /* if (withInterceptor) {
      headersMap['Authorization'] = 'Bearer ${yourToken}';
    } */

    return headersMap;
  }

  void close() {
    _client.close();
  }
}
