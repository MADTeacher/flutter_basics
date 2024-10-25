import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) async {
    // var _chatWorking = false;

    channel.stream.listen((message) {
      print(message);
    });

    var lastMessageSeconds = 0;

    for (var i = 1; i < 100; i++) {
      const timeSec = 1;
      await Future.delayed(const Duration(seconds: timeSec), () {
        lastMessageSeconds += timeSec;
        channel.sink.add(
          'Почему не отвечаешь? Уже $lastMessageSeconds сек. прошло',
        );
      });
    }
  });
  return handler(context);
}
