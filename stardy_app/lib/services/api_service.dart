import 'dart:convert';
import 'package:http/http.dart' as http;

/// Thrown for any non-2xx response from [ApiService].
class ApiException implements Exception {
  final int statusCode;
  final String body;

  ApiException(this.statusCode, this.body);

  @override
  String toString() => 'ApiException($statusCode): $body';
}


class ApiService {
  ApiService._();
  static final ApiService instance = ApiService._();

  // TODO: replace with real base URL.
  static const String baseUrl = 'https://api.example.com';

  Future<dynamic> get(String path, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$baseUrl$path'),
      headers: headers,
    );
    return _decode(response);
  }

  Future<dynamic> post(
    String path, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json', ...?headers},
      body: jsonEncode(body),
    );
    return _decode(response);
  }

  Future<dynamic> put(
    String path, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json', ...?headers},
      body: jsonEncode(body),
    );
    return _decode(response);
  }

  Future<dynamic> delete(String path, {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$path'),
      headers: headers,
    );
    return _decode(response);
  }

  dynamic _decode(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    }
    throw ApiException(response.statusCode, response.body);
  }
}
