import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final http.Client _client;
  final int timeoutInSeconds = 10;

  ApiService() : _client = http.Client();

  Future<http.Response> post(
    String path, {
    bool withInterceptor = true,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final finalHeaders = _prepareHeaders(headers, withInterceptor);

    return _client.post(
      uri,
      headers: finalHeaders,
      body: data != null ? json.encode(data) : null,
    );
  }

  Future<http.Response> put(
    String path, {
    bool withInterceptor = true,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final finalHeaders = _prepareHeaders(headers, withInterceptor);

    return _client.put(
      uri,
      headers: finalHeaders,
      body: data != null ? json.encode(data) : null,
    );
  }

  Future<http.Response> patch(
    String path, {
    bool withInterceptor = true,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final finalHeaders = _prepareHeaders(headers, withInterceptor);

    return _client.patch(
      uri,
      headers: finalHeaders,
      body: data != null ? json.encode(data) : null,
    );
  }

  Future<http.Response> get(
    String path, {
    bool withInterceptor = true,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final finalHeaders = _prepareHeaders(headers, withInterceptor);

    return _client.get(uri, headers: finalHeaders);
  }

  Future<http.Response> delete(
    String path, {
    bool withInterceptor = true,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final finalHeaders = _prepareHeaders(headers, withInterceptor);

    return _client.delete(uri, headers: finalHeaders);
  }

  Uri _buildUri(String path, Map<String, dynamic>? queryParameters) {
    return Uri.parse(path).replace(
      queryParameters: queryParameters?.map((key, value) => MapEntry(key, value.toString())),
    );
  }

  Map<String, String> _prepareHeaders(Map<String, String>? headers, bool withInterceptor) {
    final headersMap = headers ?? {};
    // if (withInterceptor) {
    //   headersMap['Authorization'] = 'Bearer ${dataBase.getToken()}';
    // }
    headersMap['Content-Type'] = 'application/json';
    return headersMap;
  }

  void close() {
    _client.close();
  }
}
