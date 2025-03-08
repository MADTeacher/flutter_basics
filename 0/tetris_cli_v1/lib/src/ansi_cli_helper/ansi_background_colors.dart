/// Варианты цвета фона
enum AnsiBackgroundColor{
  black('\u001b[40m'),
  red('\u001b[41m'),
  green('\u001b[42m'),
  yellow('\u001b[43m'),
  blue('\u001b[44m'),
  magenta('\u001b[45m'),
  cyan('\u001b[46m'),
  white('\u001b[47m');

  final String ansiText;
  const AnsiBackgroundColor(this.ansiText);
}