import 'package:dart_frog/dart_frog.dart';
import 'package:drift/native.dart';
import 'package:tetris_backend/repository/users/models/create_user.dart';
import 'package:tetris_backend/repository/users/users_repository.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

  if (method == HttpMethod.post) {
    return await _post(context);
  }

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

    ///TODO: можно добавить валидацию email и noickname по реугляркам

    final user = await usersRepository.create(userToCreate);
    return Response.json(body: user, statusCode: 201);
  } catch (e) {
    print(e);
    if (e is SqliteException) {
      //TODO: нужно обрабатывать иначе, но иначе никак)
      if (e.message.contains('UNIQUE')) {
        return Response.json(
          body: {'message': 'Пользователь с таким email уже существует'},
          statusCode: 400,
        );
      }
    }
    return Response.json(
      body: {'message': 'Что-то пошло не так'},
      statusCode: 500,
    );
  }
}
