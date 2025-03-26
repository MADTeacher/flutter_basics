import 'package:flutter/material.dart';
import 'package:tetris/di_container.dart';
import 'package:tetris/features/board/board_entity.dart';

/// Экран лучших результатов
class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late final Future<List<BoardEntity>> _futureListUsers;

  @override
  void initState() {
    super.initState();
    final diContainer = DiContainer.of(context);
    _futureListUsers = diContainer.boardApi.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Лучшие результаты')),
        body: Center(
          child: FutureBuilder(
            future: _futureListUsers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('Ошибка: ${snapshot.error}'),
                );
              } else {
                final List<BoardEntity> users =
                    snapshot.data as List<BoardEntity>;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final BoardEntity user = users[index];
                    return ListTile(
                      title: Text(user.username),
                      subtitle: Text('Очки: ${user.scores}'),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
