import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:talker/talker.dart';
import 'package:tetris_backend/repository/game_results/game_results_repository.dart';
import 'package:tetris_backend/repository/users/users_repository.dart';
import 'package:tetris_backend/utils/database.dart';

Future<HttpServer> run(
  Handler handler,
  InternetAddress ip,
  int port,
) async {
  final talker = Talker(
    settings: TalkerSettings(),
    logger: TalkerLogger(),
  );

  final db = Database();
  final usersRepo = UsersRepository(db: db);
  final gameResultsRepo = GameResultsRepository(db);

  return serve(
    handler
        .use(_userRepoProvider(usersRepo))
        .use(_gameResultRepoProvider(gameResultsRepo)),
    ip,
    port,
  );
}

Middleware _userRepoProvider(UsersRepository repo) {
  return provider<UsersRepository>((context) => repo);
}

Middleware _gameResultRepoProvider(GameResultsRepository repo) {
  return provider<GameResultsRepository>((context) => repo);
}
