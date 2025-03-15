import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_screen.dart';
import 'l10n/gen/app_localizations.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  Locale _locale = const Locale('en');

  void _toggleLocale() {
    setState(() {
      _locale =
          _locale.languageCode == 'en'
              ? const Locale('ru')
              : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).title,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ru')],
      locale: _locale,
      debugShowCheckedModeBanner: false,
      home: DemoAppScreen(onLocaleToggle: _toggleLocale),
    );
  }
}
