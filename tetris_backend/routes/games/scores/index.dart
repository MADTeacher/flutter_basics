import 'package:dart_frog/dart_frog.dart';
import 'package:tetris_backend/repository/game_results/game_results_repository.dart';
import 'package:tetris_backend/repository/game_results/models/create_game_result.dart';
import 'package:tetris_backend/repository/users/users_repository.dart';
import 'package:tetris_backend/utils/database.dart';

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
  try {
    final usersRepository = context.read<UsersRepository>();
    final resultsRepository = context.read<GameResultsRepository>();

    final body = await context.request.json() as Map<String, dynamic>;
    final input = CreateGameResult.fromJson(body);

    final isUserExist = await _isUserExist(usersRepository, input);
    if (!isUserExist) {
      return Response.json(
        body: {'message': 'Пользователь не найден'},
        statusCode: 400,
      );
    }

    final gameResult = await resultsRepository.create(input);
    return Response.json(body: gameResult, statusCode: 201);
  } catch (e) {
    return Response.json(
      body: {'message': 'Что-то пошло не так'},
      statusCode: 500,
    );
  }
}

Future<bool> _isUserExist(
  UsersRepository usersRepository,
  CreateGameResult resultToCreate,
) async {
  try {
    await usersRepository.getUser(resultToCreate.userId);
    return true;
  } on NotExistsException catch (_) {
    return false;
  }
}
