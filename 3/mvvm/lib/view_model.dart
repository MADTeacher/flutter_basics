import 'package:flutter/material.dart';
import 'model.dart';

class ViewModel extends ChangeNotifier {
  final Model _counterModel;

  ViewModel(this._counterModel);

  // Получение текущего значения счетчика из модели
  int get counter => _counterModel.counter;

  // Метод для увеличения счетчика
  void increment() {
    _counterModel.increment();
    // Уведомление слушателей об изменении состояния
    notifyListeners();  
  }

  // Метод для уменьшения счетчика
  void decrement() {
    _counterModel.decrement();
    // Уведомление слушателей об изменении состояния
    notifyListeners();
  }
}