import 'package:app_state/mvp/model.dart';
import 'package:app_state/mvp/view.dart';

/// Представитель (Presenter).
/// Увеличивает или уменьшает значение счетчика в модели.
/// Уведомляет View о изменении значения счетчика.
class Presenter {
  final View view;
  final Model _counter = Model(0);

  Presenter(this.view);

  void increment() {
    _counter.value++;
    view.updateCounter(_counter.value);
  }

  void decrement() {
    _counter.value--;
    view.updateCounter(_counter.value);
  }
}
