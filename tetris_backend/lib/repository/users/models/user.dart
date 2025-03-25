// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tetris_backend/utils/database.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.score,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String username;
  final int? score;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'score': score,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory User.fromDto(UserDto dto) => User(
        id: dto.id,
        username: dto.username,
        score: dto.score,
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
      );

  User copyWith({
    int? id,
    String? username,
    int? score,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
