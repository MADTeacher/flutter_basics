import 'package:flutter/widgets.dart';

class MathModel extends ChangeNotifier {
  int? _firstValue;
  int? _secondValue;
  int? result;

  bool get isReady => _firstValue != null && _secondValue != null;

  set firstValue(String value) {
    _firstValue = int.tryParse(value);
  }

  set secondValue(String value) {
    _secondValue = int.tryParse(value);
  }

  void add() {
    if (isReady) {
      result = _firstValue! + _secondValue!;
      notifyListeners();
    }
  }

  void subtract() {
    if (isReady) {
      result = _firstValue! - _secondValue!;
      notifyListeners();
    }
  }

  void multiply() {
    if (isReady) {
      result = _firstValue! * _secondValue!;
      notifyListeners();
    }
  }

  void modDivide() {
    if (isReady) {
      result = _firstValue! % _secondValue!;
      notifyListeners();
    }
  }
}
