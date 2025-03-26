import 'dart:io';
import 'package:tetris/features/http/i_http_client.dart';

class MyHttpClient implements IHttpClient {
  final String baseUrl = 'http://localhost:8080';

  @override
  Future<HttpClientResponse> get(String path) async {
    final uri = Uri.parse('$baseUrl$path');
    final request = await HttpClient().getUrl(uri);
    final response = await request.close();
    return response;
  }

  @override
  Future<HttpClientResponse> post(String path, {Object? body}) async {
    final uri = Uri.parse('$baseUrl$path');
    final request = await HttpClient().postUrl(uri);
    if (body != null) {
      request.headers.contentType = ContentType.json;
      request.write(body);
    }
    final response = await request.close();
    return response;
  }

  @override
  Future<HttpClientResponse> put(String path, {Object? body}) async {
    final uri = Uri.parse('$baseUrl$path');
    final request = await HttpClient().putUrl(uri);
    if (body != null) {
      request.headers.contentType = ContentType.json;
      request.write(body);
    }
    final response = await request.close();
    return response;
  }
}
