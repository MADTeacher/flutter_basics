import 'package:dart_frog/dart_frog.dart';
import 'package:talker/talker.dart';
import 'package:tetris_backend/repository/game_results/game_results_repository.dart';
import 'package:tetris_backend/repository/game_results/models/models.dart';
import 'package:tetris_backend/repository/users/users_repository.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

  if (method == HttpMethod.post) {
    return await _post(context);
  }
  if (method == HttpMethod.get) {
    return await _get(context);
  }

  return Response.json(
    body: {'message': 'Метод не поддерживается'},
    statusCode: 405,
  );
}

Future<Response> _get(RequestContext context) async {
  final resultsRepository = context.read<GameResultsRepository>();
  final usersWithResults = await resultsRepository.getUsersWithScores();
  return Response.json(body: usersWithResults);
}

Future<Response> _post(
  RequestContext context,
) async {
  final talker = context.read<Talker>();
  try {
    final usersRepository = context.read<UsersRepository>();
    final resultsRepository = context.read<GameResultsRepository>();

    final body = await context.request.json() as Map<String, dynamic>;
    final nickname = body['nickname'];
    final score = body['score'] as int;

    final user = await usersRepository.getOrCreateUser(nickname);
    final gameScore = await resultsRepository.create(
      CreateGameScore(
        userId: user.id,
        score: score,
      ),
    );

    return Response.json(body: gameScore, statusCode: 201);
  } catch (e, st) {
    talker.handle(e, st);
    return Response.json(
      body: {'message': 'Что-то пошло не так'},
      statusCode: 500,
    );
  }
}
