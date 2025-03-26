import 'package:http/http.dart' as http;
import 'package:tetris/features/http/i_http_client.dart';

class MyHttpClient implements IHttpClient {
  final String baseUrl = 'http://localhost:8080';

  @override
  Future<http.Response> get(String path) {
    return http.get(Uri.parse('$baseUrl$path'));
  }

  @override
  Future<http.Response> post(String path, {Object? body}) {
    return http.post(Uri.parse('$baseUrl$path'), body: body);
  }

  @override
  Future<http.Response> put(String path, {Object? body}) {
    return http.put(Uri.parse('$baseUrl$path'), body: body);
  }
}
