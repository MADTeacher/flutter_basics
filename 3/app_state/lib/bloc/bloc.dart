import 'dart:async';

/// Событие, которое может принимать блок
/// Реализовано:
/// событие increment - увеличение счетчика
/// событие decrement - уменьшение счетчика
enum BlocEvent { increment, decrement }

/// Состояние блока
final class BlocState {
  final int count;
  BlocState(this.count);
}

/// Реализация бизнес логики в bloc
class CounterBloc {
  /// Внутреннее состояние блока
  BlocState _state = BlocState(0);
  BlocState get state => _state;

  /// Поток для состояний
  final _stateController = StreamController<BlocState>.broadcast();
  Stream<BlocState> get stream => _stateController.stream;

  /// Поток для событий
  final _eventController = StreamController<BlocEvent>.broadcast();

  /// Подписка на события
  late StreamSubscription _eventSubscription;

  CounterBloc() {
    // Подписываемся на события
    _eventSubscription = _eventController.stream.listen(_mapEventToState);
  }

  /// Добавление события в блок
  void add(BlocEvent event) {
    _eventController.add(event);
  }

  /// Преобразование события в состояние
  void _mapEventToState(BlocEvent event) {
    switch (event) {
      // Если событие увеличения счетчика
      case BlocEvent.increment:
        // Увеличиваем счетчик
        final count = _state.count + 1;
        _saveAndUpdateState(count);
        break;
      // Если событие уменьшения счетчика
      case BlocEvent.decrement:
        // уменьшаем счетчик
        final count = _state.count - 1;
        _saveAndUpdateState(count);
        break;
    }
  }

  /// Сохраняем состояние в блоке и передаем его подписчикам
  void _saveAndUpdateState(int count) {
    // Создаем новое состояние
    final newState = BlocState(count);
    // Уведомляем подписчиков и передаем новое состояние
    _stateController.add(newState);
    // Сохраняем новое состояние в блоке
    _state = newState;
  }

  // Освобождение ресурсов
  void dispose() {
    _stateController.close();
    _eventController.close();
    _eventSubscription.cancel();
  }
}
