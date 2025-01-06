import 'dart:io';

// Константы заливки фона
typedef AnsiBackgroundColor = String;
const AnsiBackgroundColor blackBgColor = '\u001b[40m';
const AnsiBackgroundColor redBgColor = '\u001b[41m';
const AnsiBackgroundColor greenBgColor = '\u001b[42m';
const AnsiBackgroundColor yellowBgColor = '\u001b[43m';
const AnsiBackgroundColor blueBgColor = '\u001b[44m';
const AnsiBackgroundColor magentaBgColor = '\u001b[45m';
const AnsiBackgroundColor cyanBgColor = '\u001b[46m';
const AnsiBackgroundColor whiteBgColor = '\u001b[47m';

// Константы цвета текста
typedef AnsiTextColor = String;
const AnsiTextColor blackTColor = '\u001b[30m';
const AnsiTextColor redTColor = '\u001b[31m';
const AnsiTextColor greenTColor = '\u001b[32m';
const AnsiTextColor yellowTColor = '\u001b[33m';
const AnsiTextColor blueTColor = '\u001b[34m';
const AnsiTextColor magentaTColor = '\u001b[35m';
const AnsiTextColor cyanTColor = '\u001b[36m';
const AnsiTextColor whiteTColor = '\u001b[37m';

bool _isHideCursor = false;

bool isHideCursor() => _isHideCursor;

// Функция для показа курсора
void showCursor() {
  if (_isHideCursor) {
    stdout.write('\u001b[?25h'); // Включение курсора
    _isHideCursor = false;
  }
}

// Функция для скрытия курсора
void hideCursor() {
  if (!_isHideCursor) {
    stdout.write('\u001b[?25l'); // Выключение курсора
    _isHideCursor = true;
  }
}

// Функция для очистки экрана
void clear() {
  stdout.write('\u001b[2J\u001b[0;0H'); // Очистка экрана
}

// Функция для очистки экрана и сброса цветов
void reset() {
  setTextColor(whiteTColor);
  setBackgroundColor(blackBgColor);
  clear();
  showCursor();
}

// Функция для установки цвета текста
void setTextColor(AnsiTextColor color) {
  stdout.write(color);
}

// Функция для установки цвета фона
void setBackgroundColor(AnsiBackgroundColor color) {
  stdout.write(color);
}

// Функция для перемещения курсора в заданную позицию
// считается от левого верхнего угла, чьи координаты - 0, 0
void gotoxy(int x, int y) {
  if (x < 0 || y < 0) {
    return;
  }
  stdout.write('\u001b[$y;${x}H');
}