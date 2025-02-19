import 'package:flutter/material.dart';
import 'package:flutter_tetris/screens/game_over_screen.dart';
import 'package:flutter_tetris/screens/game_screen.dart';
import 'package:flutter_tetris/screens/root_screen.dart';

part 'app_router.dart';

void main() => runApp(const _MyGame());

class _MyGame extends StatelessWidget {
  const _MyGame();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter._appRoutes,
    );
  }
}
