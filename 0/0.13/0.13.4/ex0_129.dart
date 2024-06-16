Future<String> getBigData() async {
  return 'Гигатонны информации))';
}

Future<String> changeData(String data) async {
  return data.toUpperCase();
}

Future<void> makeRequestData() async {
  print('Запрос данных');
  var data = await getBigData();
  print(data);
  print('Данные получены');
  print('Приступаем к изменению данных');
  print(await changeData(data));
  print('Данные изменены');
}

void main(List<String> arguments) {
  print('Запуск main');
  makeRequestData();
  print('Завершение main');
}
