import 'package:dart_frog/dart_frog.dart';
import 'package:talker/talker.dart';
import 'package:tetris_backend/repository/users/users_repository.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

  if (method == HttpMethod.put) {
    return await _put(context);
  }

  return Response.json(
    body: {'message': 'Метод не поддерживается'},
    statusCode: 405,
  );
}

Future<Response> _put(
  RequestContext context,
) async {
  final talker = context.read<Talker>();
  try {
    final usersRepository = context.read<UsersRepository>();
    final body = await context.request.json() as Map<String, dynamic>;
    final username = body['username'];
    final score = body['score'] as int;

    final user = await usersRepository.setScore(username, score);
    return Response.json(body: user);
  } catch (e, st) {
    talker.handle(e, st);
    return Response.json(
      body: {'message': 'Что-то пошло не так'},
      statusCode: 500,
    );
  }
}
