// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Pizza Details';

  @override
  String get pizzaName => 'Pepperoni Pizza';

  @override
  String get pizzaIngredients => 'Ingredients: Pepperoni, Cheese, Tomato Sauce';

  @override
  String get orderPizzaButton => 'Order 1 more pizza';
}
