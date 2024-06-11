import 'package:ex_notifier_model_1/math_model.dart';
import 'package:flutter/widgets.dart';

class MathInherited extends InheritedNotifier<MathModel> {
  const MathInherited({
    super.key,
    required super.notifier,
    required super.child,
  });

  @override
  bool updateShouldNotify(MathInherited oldWidget) {
    return notifier != oldWidget.notifier;
  }

  // Методы для подписки на изменения
  static MathModel? maybeSubscribeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MathInherited>()
        ?.notifier;
  }

  static MathModel subscribeOf(BuildContext context) {
    final MathModel? result = maybeSubscribeOf(context);
    assert(
      result != null,
      'Unable to find an instance of MathModel',
    );
    return result!;
  }

  // Методы для получения модели без подписки
  static MathModel? maybeModelOf(BuildContext context) {
    var widget = context
        .getElementForInheritedWidgetOfExactType<MathInherited>()
        ?.widget;
    return widget is MathInherited ? widget.notifier : null;
  }

  static MathModel modelOf(BuildContext context) {
    final MathModel? result = maybeModelOf(context);
    assert(
      result != null,
      'Unable to find an instance of MathModel',
    );
    return result!;
  }
}
