// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:backend_repository/backend_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final userRepository = UsersRepository();

  final request = context.request;
  final method = request.method;

  if (method == HttpMethod.post) {
    return _post(context);
  }

  return _get(context, userRepository);
}

Future<Response> _post(RequestContext context) async {
  final request = context.request;
  final body = await request.body();
  final reqData = jsonDecode(body);
  final user = User.fromJson(reqData as Map<String, dynamic>);
  return Response.json(statusCode: 201, body: user);
}

Future<Response> _get(
  RequestContext context,
  UsersRepository userRepository,
) async {
  final users = await userRepository.getUsers();
  return Response.json(body: users);
}
