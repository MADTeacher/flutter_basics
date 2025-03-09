import 'package:dart_frog/dart_frog.dart';
import 'package:tetris_backend/repository/users/models/create_user.dart';
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
  final usersRepository = context.read<UsersRepository>();
  final users = await usersRepository.getUsers();
  return Response.json(body: users);
}

Future<Response> _post(
  RequestContext context,
) async {
  try {
    final usersRepository = context.read<UsersRepository>();
    final body = await context.request.json() as Map<String, dynamic>;
    final userToCreate = CreateUser.fromJson(body);

    if (userToCreate.email.isEmpty || userToCreate.nickname.isEmpty) {
      return Response.json(
        body: {'message': "Неправильный формат данных"},
        statusCode: 400,
      );
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(userToCreate.email)) {
      return Response.json(
        body: {'message': "Неправильный формат email"},
        statusCode: 400,
      );
    }

    final isUserExis = await usersRepository.containsUserWithEmail(
      userToCreate.email,
    );
    if (isUserExis) {
      return Response.json(
        body: {'message': 'Пользователь с таким email уже существует'},
        statusCode: 400,
      );
    }

    final user = await usersRepository.createUser(userToCreate);
    return Response.json(body: user, statusCode: 201);
  } catch (e) {
    return Response.json(
      body: {'message': 'Что-то пошло не так'},
      statusCode: 500,
    );
  }
}
