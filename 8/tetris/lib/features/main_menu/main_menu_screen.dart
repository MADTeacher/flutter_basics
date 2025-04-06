import 'package:flutter/material.dart';
import 'package:tetris/l10n/gen/app_localizations.dart';
import 'package:tetris/main.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () {
                // Переход на экран игры
                Navigator.pushReplacementNamed(
                  context,
                  GameRouter.userRoute,
                );
              },
              child: Text(l10n.startGame)),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                // Переход на экран ввода имени игрока
                Navigator.pushNamed(
                  context,
                  GameRouter.leaderboardRoute,
                );
              },
              child: Text(l10n.bestResults)),
          SizedBox(height: 16),
          // Добавляем переключатель языка в приложении
          _buildLanguageSwitcher(context),
        ],
      ),
    ));
  }

  Widget _buildLanguageSwitcher(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;

    return Column(
      children: [
        Text(
          l10n.language,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Английский язык
            _buildLanguageOption(
              context: context,
              languageCode: 'en',
              languageName: l10n.english,
              isSelected: currentLocale == 'en',
            ),
            SizedBox(width: 16),
            // Русский язык
            _buildLanguageOption(
              context: context,
              languageCode: 'ru',
              languageName: l10n.russian,
              isSelected: currentLocale == 'ru',
            ),
          ],
        ),
      ],
    );
  }

  /// Метод принимает на вход строковый код языка, 
  /// его имя и признак того,является ли язык выбранным. 
  /// Если язык выбран, то он будет отображаться жирным шрифтом, 
  /// а если нет - обычным
  /// 
  /// При нажатии на кнопку с языком будет вызван метод
  /// [MyAppState.setLocale] для изменения языка.
  Widget _buildLanguageOption({
    required BuildContext context,
    required String languageCode,
    required String languageName,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        // Ищем ближайший к текущему контексту экземпляр класса
        // [MyAppState] и вызываем у него метод [setLocale],
        // чтобы изменить язык.
        final state = context.findAncestorStateOfType<MyAppState>();
        if (state != null) {
          state.setLocale(Locale(languageCode));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          // Если язык выбран, то фон будет основным цветом,
          // если нет, то серым.
          color: isSelected
              ? Theme.of(
                  context,
                ).primaryColor
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          languageName,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
