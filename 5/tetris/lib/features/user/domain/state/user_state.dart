import 'package:tetris/app/equals_mixin.dart';
import 'package:tetris/features/user/domain/user_entity.dart';

/// Состояние блока
sealed class UserBlocState with EqualsMixin {
  const UserBlocState();

  @override
  List<Object?> get fields => [];
}

/// Состояние инициализации
final class UserBlocInit extends UserBlocState {
  const UserBlocInit();
}

/// Состояние загрузки
final class UserBlocLoading extends UserBlocState {
  const UserBlocLoading();
}

/// Состояние успешной загрузки
final class UserBlocSuccess extends UserBlocState {
  final UserEntity userEntity;

  const UserBlocSuccess(this.userEntity);

  @override
  List<Object?> get fields => [userEntity];
}

/// Состояние ошибки
final class UserBlocError extends UserBlocState {
  final String message;
  final Object error;
  final StackTrace? stackTrace;

  const UserBlocError(
    this.message, {
    required this.error,
    this.stackTrace,
  });

  @override
  List<Object?> get fields => [message, error, stackTrace];
}
