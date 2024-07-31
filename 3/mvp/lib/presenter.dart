import 'model.dart';
import 'view.dart';

/// Увеличивает или уменьшает значение счетчика в модели.
/// Уведомляет View о изменении значения счетчика.
class Presenter {
  View? _view;
  final Model _counter;

  Presenter({View? view, required Model model})
      : _view = view,
        _counter = model;

  int get countValue => _counter.value;
  set view(View? view) => _view = view;
  
  void increment() {
    _counter.value++;
    _view?.updateCounter(_counter.value);
  }

  void decrement() {
    _counter.value--;
    _view?.updateCounter(_counter.value);
  }
}
