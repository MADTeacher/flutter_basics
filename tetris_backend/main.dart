import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:talker_dart_frog_logger/talker_dart_frog_logger.dart';
import 'package:tetris_backend/repository/game_results/game_results_repository.dart';
import 'package:tetris_backend/repository/users/users_repository.dart';
import 'package:tetris_backend/utils/database.dart';

Future<HttpServer> run(
  Handler handler,
  InternetAddress ip,
  int port,
) async {
  final talker = Talker(
    logger: TalkerLogger(
      formatter: const DartFrogLoggerFormatter(),
    ),
  );

  final db = Database();
  final usersRepo = UsersRepository(db: db);
  final gameResultsRepo = GameResultsRepository(db);

  return serve(
    handler
        .use(_talkerProvider(talker))
        .use(_userRepoProvider(usersRepo))
        .use(_gameResultRepoProvider(gameResultsRepo)),
    ip,
    port,
  );
}

Middleware _talkerProvider(Talker talker) {
  return provider<Talker>((context) => talker);
}

Middleware _userRepoProvider(UsersRepository repo) {
  return provider<UsersRepository>((context) => repo);
}

Middleware _gameResultRepoProvider(GameResultsRepository repo) {
  return provider<GameResultsRepository>((context) => repo);
}
