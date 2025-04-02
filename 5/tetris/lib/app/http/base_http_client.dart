import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'i_http_client.dart';

/// Базовая реализация интерфейса IHttpClient для отправки HTTP запросов
class BaseHttpClient implements IHttpClient {
  /// Определяет хост в зависимости от платформы
  /// Так как на Android эмулятор работает
  /// на localhost
  String get host {
    if (kIsWeb) {
      return 'localhost';
    } else if (Platform.isAndroid) {
      return '10.0.2.2';
    } else {
      return 'localhost';
    }
  }

  /// Переопределяет базовый URL для запросов
  @override
  String get baseUrl => 'http://$host:8080';

  /// Отправляет GET запрос на указанный путь
  @override
  Future<http.Response> get(String path) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.get(uri);
    return response;
  }

  @override
  Future<http.Response> post(String path, {Object? body}) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.post(uri, body: jsonEncode(body));

    return response;
  }

  @override
  Future<http.Response> put(String path, {Object? body}) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.put(uri, body: jsonEncode(body));

    return response;
  }
}
