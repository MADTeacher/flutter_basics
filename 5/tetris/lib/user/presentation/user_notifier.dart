import 'package:flutter/material.dart';
import 'package:tetris/user/domain/entity/user_entity.dart';
import 'package:tetris/user/data/user_repository.dart';

class UserNotifier extends ChangeNotifier {
  final UserRepository userRepository;

  UserEntity? _user;
  UserEntity? get user => _user;

  UserNotifier({required this.userRepository});

  Future<void> createUser(String username, String scores) async {
    try {
      _user = await userRepository.createUser(username, scores);
      notifyListeners();
    } catch (e) {
      // Обработка ошибок
      debugPrint('Failed to fetch user: $e');
    }
  }



}
