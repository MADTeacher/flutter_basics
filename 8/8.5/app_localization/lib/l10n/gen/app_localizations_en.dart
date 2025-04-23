// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get nameHint => 'Enter your name';

  @override
  String hello(String userName) {
    return 'Hello $userName!';
  }

  @override
  String get send => 'Send';

  @override
  String get title => 'Pizza Details';

  @override
  String get pizzaName => 'Pepperoni Pizza';

  @override
  String get pizzaIngredients => 'Ingredients: Pepperoni, Cheese, Tomato Sauce';

  @override
  String orderPizzaButton(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Order 1 more pizza',
      zero: 'Order first pizza',
    );
    return '$_temp0';
  }

  @override
  String orderPizza(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You ordered $count pizzas',
      one: 'You ordered 1 pizza',
      zero: 'You haven\'t ordered any pizzas yet',
    );
    return '$_temp0';
  }

  @override
  String get pizzaSizeLabel => 'Select pizza size';

  @override
  String selectedSize(String size) {
    return 'Selected pizza size - $size';
  }

  @override
  String pizzaSize(String size) {
    String _temp0 = intl.Intl.selectLogic(
      size,
      {
        'mini': 'Mini',
        'small': 'Small',
        'medium': 'Medium',
        'large': 'Large',
        'supersize': 'Supersize',
        'other': 'Unknown',
      },
    );
    return '$_temp0';
  }
}
