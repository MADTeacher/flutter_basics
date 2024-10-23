import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _client = HttpInterceptorClient(
    http.Client(),
    interceptor: LoggerInterceptor(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _client.get(Uri.parse('http://localhost:8080/hello'));
          },
          child: const Text('Отправить запрос'),
        ),
      ),
    );
  }
}

class LoggerInterceptor extends HttpInterceptor {
  @override
  void onRequest(http.BaseRequest request) {
    print('Отправляем ${request.method} запрос${request.url}');
  }

  @override
  void onResponse(http.StreamedResponse response) {
    print('Статус ответа от сервера:${response.statusCode}');
  }
}

class HttpInterceptorClient extends http.BaseClient {
  HttpInterceptorClient(
    this._inner, {
    this.interceptor,
  });
  final http.Client _inner;
  final HttpInterceptor? interceptor;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    /// Сообщаем в intercetor о произошедшем запросе на сервер
    interceptor?.onRequest(request);
    final response = await _inner.send(request);

    /// Сообщаем в intercetor о пришедшем ответе от сервера
    interceptor?.onResponse(response);
    return response;
  }
}

abstract class HttpInterceptor {
  /// Called when the request is about to be sent.
  void onRequest(http.BaseRequest request);

  /// Called when the response is about to be resolved.
  void onResponse(http.StreamedResponse response);
}
