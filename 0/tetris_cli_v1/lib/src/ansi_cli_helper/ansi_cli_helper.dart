import 'dart:io';
// импортируем варианты цвета текста и фона
import 'ansi_background_colors.dart';
import 'ansi_text_colors.dart';

// экспортируем варианты цвета текста и фона
export 'ansi_background_colors.dart';
export 'ansi_text_colors.dart';

// От класса нельзя наследоваться или использовать как интерфейсный
final class AnsiCliHelper {
  static AnsiCliHelper? _instance;
  bool _isHideCursor = false;

  AnsiCliHelper._();

  // Паттерн проектирования Singleton
  factory AnsiCliHelper() {
    return _instance ??= AnsiCliHelper._();
  }

  bool get isHideCursor => _isHideCursor;

  // Метод показа курсора
  void showCursor() {
    if (_isHideCursor) {
      stdout.write('\u001b[?25h'); // Включение курсора
      _isHideCursor = false;
    }
  }

  // Метод скрытия курсора
  void hideCursor() {
    if (!_isHideCursor) {
      stdout.write('\u001b[?25l'); // Выключение курсора
      _isHideCursor = true;
    }
  }

  // Метод очистки экрана
  void clear() {
    stdout.write('\u001b[2J\u001b[0;0H'); // Очистка экрана
  }

  // Метод очистки экрана и сброса цветов
  void reset() {
    setTextColor(AnsiTextColor.white);
    setBackgroundColor(AnsiBackgroundColor.black);
    clear();
    showCursor();
  }

  // Метод вывода текста в терминал без переноса на новую строку
  void write(String text) {
    stdout.write(text);
  }

  // Метод вывода текста в терминал с переносом на новую строку
  void writeLine(String text) {
    stdout.writeln(text);
  }

  // Метод установки цвета текста
  void setTextColor(AnsiTextColor color) {
    stdout.write(color.ansiText);
  }

  // Метод установки цвета фона
  void setBackgroundColor(AnsiBackgroundColor color) {
    stdout.write(color.ansiText);
  }

  // Метод для перемещения курсора в заданную позицию
  // считается от левого верхнего угла, чьи координаты - 0, 0
  void gotoxy(int x, int y) {
    if (x < 0 || y < 0) {
      return;
    }
    stdout.write('\u001b[$y;${x}H');
  }
}
