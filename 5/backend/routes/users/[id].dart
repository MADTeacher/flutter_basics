import 'package:backend_repository/backend_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String? id) async {
  final userRepository = UsersRepository();

  if (id == null || id.isEmpty) {
    return Response.json(statusCode: 400);
  }

  final userId = int.parse(id);
  return _getById(context, userId, userRepository);
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
