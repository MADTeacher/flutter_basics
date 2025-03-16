// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Date and Time';

  @override
  String dateFormat1(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Date: $dateString';
  }

  @override
  String dateFormat2(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Full date: $dateString';
  }

  @override
  String timeFormat(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.Hm(localeName);
    final String timeString = timeDateFormat.format(time);

    return 'Time: $timeString';
  }

  @override
  String dateTimeFormat(DateTime dateTime) {
    final intl.DateFormat dateTimeDateFormat = intl.DateFormat('y/M/d H:mm', localeName);
    final String dateTimeString = dateTimeDateFormat.format(dateTime);

    return 'Date and time: $dateTimeString';
  }

  @override
  String get updateDateTime => 'Update Date & Time';
}
