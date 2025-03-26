import 'package:flutter/material.dart';
import 'package:tetris/app/di_container.dart';
import 'package:tetris/features/leaderboard/domain/entity/leaderboard_entity.dart';

/// Экран лучших результатов
class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  late final Future<Iterable<Object>> _futureListUsers;

  @override
  void initState() {
    super.initState();
    final diContainer = DiContainer.of(context);
    _futureListUsers = diContainer.leaderboardBloc.fetchLeaderboard();
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
                final List<LeaderboardEntity> users =
                    snapshot.data as List<LeaderboardEntity>;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final LeaderboardEntity item = users[index];
                    return ListTile(
                      title: Text(item.username),
                      subtitle: Text('Очки: ${item.score}'),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
