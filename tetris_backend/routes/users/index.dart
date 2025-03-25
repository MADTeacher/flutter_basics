import 'package:dart_frog/dart_frog.dart';
import 'package:talker/talker.dart';
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
  final talker = context.read<Talker>();
  try {
    final resultsRepository = context.read<UsersRepository>();
    final users = await resultsRepository.getUsers();
    return Response.json(body: users);
  } catch (e, st) {
    talker.handle(e, st);
    return Response.json(
      body: {'message': 'Что-то пошло не так'},
      statusCode: 500,
    );
  }
}

Future<Response> _post(RequestContext context) async {
  final talker = context.read<Talker>();
  try {
    final resultsRepository = context.read<UsersRepository>();
    final body = await context.request.json() as Map<String, dynamic>;
    final username = body['username'];

    final user = await resultsRepository.createUser(username);
    return Response.json(body: user);
  } catch (e, st) {
    talker.handle(e, st);
    return Response.json(
      body: {'message': 'Что-то пошло не так'},
      statusCode: 500,
    );
  }
}
