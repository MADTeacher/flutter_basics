// Контроллер, управляющий логикой счетчика
import 'package:app_state/mvc/model.dart';

class Controller {
  final Model _model;

  Controller(this._model);

  // Геттер для получения текущего значения счетчика из модели
  int get counter => _model.counter;

  // Метод для увеличения значения счетчика
  void increment() {
    _model.increment();
  }

  // Метод для уменьшения значения счетчика
  void decrement() {
    _model.decrement();
  }

  // Метод для сброса значения счетчика
  void reset() {
    _model.reset();
  }
}
