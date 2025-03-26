import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';
import 'package:tetris/features/game/game_scores.dart';
import 'package:tetris/features/user/domain/state/user_state.dart';
import 'package:tetris/main.dart';

///  Экран окончания игры
class GameOverScreen extends StatefulWidget {
  const GameOverScreen({super.key});

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      builder: (context, state, child) {
        return switch (state) {
          UserBlocLoading() => CircularProgressIndicator(),
          UserBlocSuccess() => GameScores(
              score: context.user?.score ?? 0,
              onMainMenu: () {
                Navigator.pushReplacementNamed(
                    context, GameRouter.initialRoute);
              },
              onRestart: () {
                Navigator.pushReplacementNamed(context, GameRouter.gameRoute);
              }),
          _ => SizedBox.shrink(),
        };
      },
      valueListenable: context.userBloc.stateNotifier,
    ));
  }
}
