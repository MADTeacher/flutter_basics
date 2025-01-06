import 'package:tetris_cli/tetris_cli.dart';

void main(List<String> arguments) {
  Game(
    AnsiCliHelper()
      ..reset()
      ..hideCursor(),
  ).start();
}
