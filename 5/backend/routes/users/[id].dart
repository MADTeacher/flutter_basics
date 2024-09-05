import 'dart:convert';

import 'package:backend_repository/backend_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String? id) async {
  final userRepository = UsersRepository();

  final request = context.request;
  final method = request.method;

  if (id == null || id.isEmpty) {
    return Response.json(statusCode: 400);
  }

  final userId = int.parse(id);

  if (method == HttpMethod.delete) {
    return _delete(context, userId, userRepository);
  }

  if (method == HttpMethod.put) {
    return _put(context, userRepository);
  }

  return _getById(context, userId, userRepository);
}

Future<Response> _put(
  RequestContext context,
  UsersRepository userRepository,
) async {
  final request = context.request;
  final body = await request.body();
  final reqData = jsonDecode(body);
  final user = User.fromJson(reqData as Map<String, dynamic>);

  final isUserExist = await userRepository.isUserExist(user.id);

  return Response.json(statusCode: isUserExist ? 200 : 201, body: user);
}

Future<Response> _delete(
  RequestContext context,
  int id,
  UsersRepository userRepository,
) async {
  try {
    await userRepository.delete(id);
    return Response.json(body: {'success': true});
  } on NotFoundException catch (_) {
    return Response.json(statusCode: 404);
  } catch (_) {
    return Response.json(statusCode: 500);
  }
}

Future<Response> _getById(
  RequestContext context,
  int id,
  UsersRepository userRepository,
) async {
  try {
    final user = await userRepository.getUser(id);
    return Response.json(body: user);
  } on NotFoundException catch (_) {
    return Response.json(statusCode: 404);
  } catch (_) {
    return Response.json(statusCode: 500);
  }
}
