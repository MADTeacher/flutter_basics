import 'package:dart_frog/dart_frog.dart';
import 'package:talker_dart_frog_logger/talker_dart_frog_logger.dart';

Handler middleware(Handler handler) {
  return (context) async {
    final talker = context.read<Talker>();
    return loggerMiddleware(handler: handler, talker: talker)(context);
  };
}
