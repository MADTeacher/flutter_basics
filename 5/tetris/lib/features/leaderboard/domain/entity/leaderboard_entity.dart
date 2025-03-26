import 'package:flutter/foundation.dart';
import 'package:tetris/app/equals_mixin.dart';

/// Сущность пользователя
@immutable
class LeaderboardEntity with EqualsMixin {
  /// Идентификатор пользователя
  final int id;

  /// Имя пользователя
  final String username;

  /// Лучший счет пользователя
  final int score;

  const LeaderboardEntity({
    required this.id,
    required this.username,
    required this.score,
  });

  @override
  List<Object?> get fields => [id, username, score];
}
