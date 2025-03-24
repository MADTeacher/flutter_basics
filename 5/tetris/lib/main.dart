import 'package:flutter/material.dart';
import 'package:tetris/screens/game_over_screen.dart';
import 'package:tetris/screens/game_screen.dart';
import 'package:tetris/screens/main_menu_screen.dart';
import 'package:tetris/screens/score_screen.dart';
import 'package:tetris/screens/user_screen.dart';

part 'game_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: GameRouter.initialRoute,
        routes: GameRouter._appRoutes);
  }
}
