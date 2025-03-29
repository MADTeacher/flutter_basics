import 'dart:io';
import 'package:tetris/app/http/i_http_client.dart';

/// Базовая реализация интерфейса IHttpClient для отправки HTTP запросов
class BaseHttpClient implements IHttpClient {
  /// Переопределяет базовый URL для запросов
  /// В данном случае используется локальный сервер на порту 8080
  /// Это может быть изменено на любой другой URL
  @override
  final String baseUrl = 'http://localhost:8080';

  /// Отправляет GET запрос на указанный путь
  @override
  Future<HttpClientResponse> get(String path) async {
    /// Создает URI из базового URL и указанного пути
    final uri = Uri.parse('$baseUrl$path');
    /// Создает HTTP GET запрос
    final request = await HttpClient().getUrl(uri);
    /// Отправляет запрос и получает ответ
    final response = await request.close();
    /// Возвращает ответ от сервера
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
