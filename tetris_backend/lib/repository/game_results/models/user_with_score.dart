import 'package:tetris_backend/repository/game_results/models/game_score.dart';
import 'package:tetris_backend/repository/users/models/models.dart';

class UserWithScore {
  UserWithScore({
    required this.user,
    required this.score,
  });

  final User user;
  final GameScore score;

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'score': score.toJson(),
    };
  }
}
