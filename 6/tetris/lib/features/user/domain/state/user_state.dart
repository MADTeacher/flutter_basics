import 'package:tetris/app/equals_mixin.dart';
import '../user_entity.dart';

/// Состояние блока
sealed class UserState with EqualsMixin {
  const UserState();

  @override
  List<Object?> get fields => [];
}

/// Состояние инициализации
final class UserInitState extends UserState {
  const UserInitState();
}

/// Состояние загрузки
final class UserLoadingState extends UserState {
  const UserLoadingState();
}

/// Состояние успешной загрузки
final class UserSuccessState extends UserState {
  final UserEntity userEntity;

  const UserSuccessState(this.userEntity);

  @override
  List<Object?> get fields => [userEntity];
}

/// Состояние ошибки
final class UserErrorState extends UserState {
  final String message;
  final Object error;
  final StackTrace? stackTrace;

  const UserErrorState(
    this.message, {
    required this.error,
    this.stackTrace,
  });

  @override
  List<Object?> get fields => [message, error, stackTrace];
}
