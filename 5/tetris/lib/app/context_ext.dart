import 'package:flutter/material.dart';
import 'package:tetris/app/di_container.dart';
import 'package:tetris/features/user/domain/entity/user_entity.dart';
import 'package:tetris/features/user/domain/state/user_bloc.dart';

/// Удобный доступ к блоку пользователя
/// через контекст
extension ContextExt on BuildContext {
  UserBloc get userBloc => DiContainer.of(this).userBloc;
  UserEntity? get user => userBloc.stateNotifier.value.user;
}
