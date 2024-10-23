import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) async {
    channel.stream.listen((message) {
      channel.sink.add('Получил сообщение "${message?.toString() ?? ''}"');
    });
  });
  return handler(context);
}
