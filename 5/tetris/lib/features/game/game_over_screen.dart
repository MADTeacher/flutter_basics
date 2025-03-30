import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';
import 'package:tetris/features/game/game_scores.dart';
import 'package:tetris/features/user/domain/state/user_state.dart';
import 'package:tetris/main.dart';

/// Экран окончания игры
class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /// Слушатель состояния кубита пользователя
        /// и отображение соответствующего виджета
        /// в зависимости от состояния
        body: ValueListenableBuilder(
      builder: (context, state, child) {
        return switch (state) {
          UserBlocLoading() => CircularProgressIndicator(),
          UserBlocSuccess() => GameScores(
              score: state.userEntity.score,
              onRestart: () {
                Navigator.pushReplacementNamed(context, GameRouter.gameRoute);
              }),
          _ => SizedBox.shrink(),
        };
      },
      valueListenable: context.di.userCubit.stateNotifier,
    ));
  }
}
