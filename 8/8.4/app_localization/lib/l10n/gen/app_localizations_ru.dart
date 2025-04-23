// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get nameHint => 'Введите ваше имя';

  @override
  String hello(String userName) {
    return 'Привет, $userName!';
  }

  @override
  String get send => 'Отправить';

  @override
  String get title => 'Детали пиццы';

  @override
  String get pizzaName => 'Пицца Пепперони';

  @override
  String get pizzaIngredients => 'Ингредиенты: Пепперони, Сыр, Томатный соус';

  @override
  String orderPizzaButton(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Заказать ещё 1 пиццу',
      zero: 'Заказать первую пиццу',
    );
    return '$_temp0';
  }

  @override
  String orderPizza(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вы заказали $count пицц',
      few: 'Вы заказали $count пиццы',
      one: 'Вы заказали 1 пиццу',
      zero: 'Вы еще не заказали ни одной пиццы',
    );
    return '$_temp0';
  }
}
