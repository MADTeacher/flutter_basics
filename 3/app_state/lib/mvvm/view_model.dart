import 'package:app_state/mvvm/model.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  final Model _counterModel = Model();

  // Получение текущего значения счетчика из модели
  int get counter => _counterModel.counter;

  // Метод для увеличения счетчика
  void increment() {
    _counterModel.increment();
    notifyListeners();  // Уведомление слушателей об изменении состояния
  }
}
