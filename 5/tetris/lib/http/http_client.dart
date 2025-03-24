import 'package:http/http.dart' as http;

/// Интерфейс для работы с http клиентом
abstract interface class IHttpClient {
  /// Выполняет GET запрос
  Future<http.Response> get(String url);
  /// Выполняет POST запрос
  Future<http.Response> post(String url, {Map<String, String>? body});
}

/// Реализация интерфейса для работы с http клиентом
final class HttpClient implements IHttpClient {
  HttpClient() {
    _client = http.Client();
  }

  /// http клиент
  late final http.Client _client;

  @override
  Future<http.Response> get(String url) async {
    return _client.get(Uri.parse(url));
  }

  @override
  Future<http.Response> post(String url, {Map<String, String>? body}) async {
    return _client.post(Uri.parse(url), body: body);
  }
}
