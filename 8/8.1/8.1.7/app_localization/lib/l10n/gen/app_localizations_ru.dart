// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get title => 'Форматирование чисел и валюты';

  @override
  String formatInteger(int number) {
    final intl.NumberFormat numberNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String numberString = numberNumberFormat.format(number);

    return 'Целое число: $numberString';
  }

  @override
  String formatDecimal(double number) {
    final intl.NumberFormat numberNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String numberString = numberNumberFormat.format(number);

    return 'Десятичное число: $numberString';
  }

  @override
  String formatPercent(double number) {
    final intl.NumberFormat numberNumberFormat = intl.NumberFormat.percentPattern(localeName);
    final String numberString = numberNumberFormat.format(number);

    return 'Процент: $numberString';
  }

  @override
  String formatCurrency(double amount) {
    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
      
    );
    final String amountString = amountNumberFormat.format(amount);

    return 'Валюта: $amountString';
  }

  @override
  String get updateValues => 'Обновить значения';
}
