import 'package:dart_frog/dart_frog.dart';
import 'package:tetris_backend/repository/game_results/game_results_repository.dart';
import 'package:tetris_backend/repository/game_results/models/create_game_result.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

  if (method == HttpMethod.post) {
    return await _post(context);
  }

  final resultsRepository = context.read<GameResultsRepository>();
  // final users = await gameResultsRepository.getUsers();
  return Response.json(body: {'message': 'none'});
}

Future<Response> _post(
  RequestContext context,
) async {
  try {
    final resultsRepository = context.read<GameResultsRepository>();
    final body = await context.request.json() as Map<String, dynamic>;
    final resultToCreate = CreateGameResult.fromJson(body);

    ///TODO: можно добавить валидацию userId

    final gameResult = await resultsRepository.create(resultToCreate);
    return Response.json(body: gameResult, statusCode: 201);
  } catch (_) {
    return Response.json(
      body: {'message': 'Что-то пошло не так'},
      statusCode: 500,
    );
  }
}
