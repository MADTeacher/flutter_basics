import 'package:tetris/app/equals_mixin.dart';
import 'package:tetris/features/user/domain/entity/user_entity.dart';

/// Состояние блока
sealed class UserBlocState with EqualsMixin {
  final UserEntity? user;

  UserBlocState(this.user);

  @override
  List<Object?> get fields => [user];
}

/// Состояние инициализации
final class UserBlocInit extends UserBlocState {
  UserBlocInit() : super(null);
}

/// Состояние загрузки
final class UserBlocLoading extends UserBlocState {
  UserBlocLoading() : super(null);
}

/// Состояние успешной загрузки
final class UserBlocSuccess extends UserBlocState {
  @override
  UserBlocSuccess(super.user);
}

/// Состояние ошибки
final class UserBlocError extends UserBlocState {
  final String message;
  final Object error;
  final StackTrace? stackTrace;

  UserBlocError(this.message, {required this.error, this.stackTrace})
      : super(null);

  @override
  List<Object?> get fields => [message, error, stackTrace];
}
