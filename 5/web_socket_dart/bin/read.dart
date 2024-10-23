import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  final uri = Uri.parse('ws://localhost:8080/ws/read');
  final channel = WebSocketChannel.connect(uri);
  channel.stream.listen((message) {
    print(message);
  });
}
