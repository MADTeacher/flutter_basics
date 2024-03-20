import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulWidget LifeCircle'),
      ),
      body: Center(
        child: FloatingActionButton.extended(
            onPressed: () { // при нажатии на кнопку
              Navigator.push( // переход на новую страницу
                context,
                MaterialPageRoute(builder: (context) {
                  return MainPage(title: 'Main StatefulWidget');
                }),
              );
            },
            label: const Text('Go MainPage')),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;
  MainPage({super.key, required this.title}) {
    debugPrint('MainPage constructor');
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isWrapNewPage = false;
  
  // Метод для переключения значения _isWarpNewPage и обновления UI.
  void wrapNewPage() {
    // _isWrapNewPage != _isWrapNewPage;
    _isWrapNewPage = _isWrapNewPage ? false : true;
    setState(() {});
    debugPrint('isWrapNewPage: $_isWrapNewPage');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MainPage build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: MyStatefulWidget(
        isWrapped: _isWrapNewPage,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: wrapNewPage,
        child: const Icon(Icons.toc),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final bool isWrapped;
  const MyStatefulWidget({super.key, required this.isWrapped});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;
  late bool _isWrapped;

  // Метод вызывается при создании экземпляра класса и 
  // используется для инициализации изменяемых состояний
  @override
  void initState() {
    super.initState();
    _isWrapped = widget.isWrapped;
    debugPrint('--MyStatefulWidget initState');
  }

  // Метод вызывается сразу после initState и при изменении 
  // состояния объекта посредством InheritedWidget
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('--MyStatefulWidget didChangeDependencies');
  }

  // Метод вызывается каждый раз при изменении конфигурации виджета
  @override
  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('--MyStatefulWidget didUpdateWidget');
    if (oldWidget.isWrapped == widget.isWrapped) return;
    _isWrapped = widget.isWrapped; // обновляем состояние
  }

  // Метод вызывается в случае удаления объекта из дерева,
  // но он еще жив и его можно вставить в другое место дерева
  // до момента обновления кадра
  @override
  void deactivate() {
    super.deactivate();
    debugPrint('--MyStatefulWidget deactivate');
  }

  // Метод освобождения ресурсов, используемых MyStatefulWidget.
  // Вызывается в случае бесповоротного удаления виджета из дерева
  @override
  void dispose() {
    debugPrint('--MyStatefulWidget dispose');
    super.dispose();
  }

  // Пересобирает состояние виджета при Hot Reload.
  // Вызывает метод пересборки суперкласса, устанавливает
  // состояние с новым значением для переменной _counter и
  // выводит отладочное сообщение, указывающее на горячую
  // перезагрузку MyStatefulWidget.
  @override
  void reassemble() {
    super.reassemble();
    setState(() {
      _counter = 32;
    });
    debugPrint('--MyStatefulWidget hot reload');
  }

  // Функция увеличивает и выводит в терминал значение счетчика,
  // а также обновляет состояние виджета.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    debugPrint('--Counter: $_counter');
  }

  // Создает виджет на основе значения _isWrapped.
  // Если _isWrapped равно true, возвращает контейнер
  // с полупрозрачным оранжевым цветом и результатом
  // _buildWidget в качестве дочернего элемента.
  // В противном случае возвращает результат выполнения _buildWidget.
  @override
  Widget build(BuildContext context) {
    debugPrint('--MyStatefulWidget build with wrap is: $_isWrapped');
    return _isWrapped
        ? Container(
            color: Colors.deepOrange.withOpacity(0.5),
            child: _buildWidget(),
          )
        : _buildWidget();
  }

  // Функция создает и возвращает виджет, содержащий колонку
  // с виджетом текста, отображающую текущее значение счетчика,
  // и ElevatedButton, при нажатии на которую вызывается функция
  // отвечающая за увеличиение значения счетчика.
  Widget _buildWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(
            onPressed: () {
              _incrementCounter();
            },
            child: const Text('Increment1'))
      ],
    );
  }
}
