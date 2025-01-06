import 'package:tetris_cli/tetris_cli.dart';
import 'package:tetris_cli/ansi_cli_helper.dart' as ansi;

void main(List<String> arguments) {
  ansi.reset();
  ansi.hideCursor();

  initGame();
  start();
}
