import 'dart:io';

abstract interface class IHttpClient {
  Future<HttpClientResponse> post(String url, {Object? body});
  Future<HttpClientResponse> get(String url);
  Future<HttpClientResponse> put(String url, {Object? body});
}
