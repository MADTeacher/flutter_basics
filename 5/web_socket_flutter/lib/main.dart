import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(const ChatApp());

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: ChatScreen());
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:8080/ws/chat'),
  );

  StreamSubscription<dynamic>? _subscription;
  final _controller = TextEditingController();
  final _clientMessages = <String>[];
  final _serverMessages = <String>[];

  @override
  void initState() {
    _subscription = channel.stream.listen((data) {
      _serverMessages.add(data.toString());
      setState(() {});
    });
    super.initState();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _clientMessages.add(_controller.text); // Добавляем сообщение клиента
      });
      channel.sink.add(_controller.text); // Отправляем сообщение на сервер
      _controller.clear(); // Очищаем текстовое поле
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Чат с Мудрецом')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ServerMessages(
                    channel: channel,
                    serverMessages: _serverMessages,
                    onNewMessage: _serverMessages.add,
                  ),
                  const SizedBox(width: 20),
                  ClientMessages(clientMessages: _clientMessages),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Введите своё сообщение',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage, // Отправляем сообщение
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    _subscription?.cancel();
    super.dispose();
  }
}

class ServerMessages extends StatelessWidget {
  const ServerMessages({
    super.key,
    required this.channel,
    required this.serverMessages,
    required this.onNewMessage,
  });

  final WebSocketChannel channel;
  final List<String> serverMessages;
  // callback-функция для оповещения верхнего уровня о новом сообщении
  final Function(String message) onNewMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Сообщения Мудреца:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            // Прослушивание сообщений от сервера
            child: StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  onNewMessage(snapshot.data.toString());
                }
                return ListView.builder(
                  itemCount: serverMessages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(serverMessages[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ClientMessages extends StatelessWidget {
  const ClientMessages({
    super.key,
    required List<String> clientMessages,
  }) : _clientMessages = clientMessages;

  final List<String> _clientMessages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Мои сообщения:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _clientMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_clientMessages[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
