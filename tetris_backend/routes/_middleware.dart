import 'package:dart_frog/dart_frog.dart';
import 'package:talker_dart_frog_logger/talker_dart_frog_logger.dart';

Handler middleware(Handler handler) {
  return (context) async {
    final talker = context.read<Talker>();
    final response = await loggerMiddleware(handler: handler, talker: talker)(context);
    return response.copyWith(
      headers: {
        ...response.headers,
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
      },
    );
  };
}
