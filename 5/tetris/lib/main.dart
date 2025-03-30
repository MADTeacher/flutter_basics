import 'package:flutter/material.dart';
import 'package:tetris/app/di_container.dart';
import 'package:tetris/features/leaderboard/presentation/leaderboard_screen.dart';
import 'package:tetris/features/user/presentation/user_screen.dart';
import 'package:tetris/features/game/game_over_screen.dart';
import 'package:tetris/features/game/game_screen.dart';
import 'package:tetris/features/main_menu/main_menu_screen.dart';

part 'app/game_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DiContainer(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: GameRouter.initialRoute,
          routes: GameRouter._appRoutes),
    );
  }
}
