// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Number and Currency Formatting';

  @override
  String formatInteger(int number) {
    final intl.NumberFormat numberNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String numberString = numberNumberFormat.format(number);

    return 'Integer: $numberString';
  }

  @override
  String formatDecimal(double number) {
    final intl.NumberFormat numberNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String numberString = numberNumberFormat.format(number);

    return 'Decimal: $numberString';
  }

  @override
  String formatPercent(double number) {
    final intl.NumberFormat numberNumberFormat = intl.NumberFormat.percentPattern(localeName);
    final String numberString = numberNumberFormat.format(number);

    return 'Percentage: $numberString';
  }

  @override
  String formatCurrency(double amount) {
    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
      
    );
    final String amountString = amountNumberFormat.format(amount);

    return 'Currency: $amountString';
  }

  @override
  String get updateValues => 'Update Values';
}
