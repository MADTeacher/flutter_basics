import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();

  /// Передаем созданный инстанс SharedPreferences в приложение
  runApp(SharedPrefsExampleApp(preferences: preferences));
}

class SharedPrefsExampleApp extends StatelessWidget {
  const SharedPrefsExampleApp({super.key, required this.preferences});

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AppSettingsPage(preferences: preferences),
    );
  }
}

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key, required this.preferences});

  final SharedPreferences preferences;

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  late TextEditingController _languageController;
  late TextEditingController _fontSizeController;
  var _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    final settings = loadAppSettings();
    _languageController = TextEditingController(
      text: settings.language,
    );
    _fontSizeController = TextEditingController(
      text: settings.fontSize.toString(),
    );
    _isDarkMode = settings.isDarkMode;
  }

  @override
  void dispose() {
    _languageController.dispose();
    _fontSizeController.dispose();
    super.dispose();
  }

  AppSettings loadAppSettings() {
    final json = widget.preferences.getString('app_settings');
    if (json == null) {
      return const AppSettings(language: 'ru', fontSize: 18, isDarkMode: false);
    }
    return AppSettings.fromJson(json);
  }

  Future<void> saveAppSettings(AppSettings settings) async {
    final json = settings.toJson();
    await widget.preferences.setString('app_settings', json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки приложения'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _languageController,
                decoration: const InputDecoration(labelText: 'Язык'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fontSizeController,
                decoration: const InputDecoration(labelText: 'Размер шрифта'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Тёмная тема'),
                value: _isDarkMode,
                onChanged: (value) => setState(() => _isDarkMode = value),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => _onClearTap(context),
                    child: const Text('Сбросить'),
                  ),
                  ElevatedButton(
                    onPressed: () => _onSaveTap(context),
                    child: const Text('Сохранить'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSaveTap(BuildContext context) {
    final settings = AppSettings(
      language: _languageController.text,
      fontSize: double.parse(_fontSizeController.text),
      isDarkMode: _isDarkMode,
    );
    saveAppSettings(settings);
  }

  void _onClearTap(BuildContext context) {
    setState(() {
      widget.preferences.clear();
      _languageController.text = 'ru';
      _fontSizeController.text = '18';
      _isDarkMode = false;
    });
  }
}

class AppSettings {
  const AppSettings({
    required this.language,
    required this.fontSize,
    required this.isDarkMode,
  });

  final String language;
  final double fontSize;
  final bool isDarkMode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': language,
      'fontSize': fontSize,
      'isDarkMode': isDarkMode,
    };
  }

  factory AppSettings.fromMap(Map<String, dynamic> map) {
    return AppSettings(
      language: map['language'] as String,
      fontSize: map['fontSize'] as double,
      isDarkMode: map['isDarkMode'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppSettings.fromJson(String source) =>
      AppSettings.fromMap(json.decode(source) as Map<String, dynamic>);
}
