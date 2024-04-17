import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum MyColors { red, green }

Color enumToColor(MyColors color) {
  return switch (color) {
    MyColors.red => Colors.red,
    MyColors.green => Colors.green,
  };
}

class _MyHomePageState extends State<MyHomePage> {
  // FocusNode отследивания нажатия по кнопке вызова меню
  final FocusNode buttonFN = FocusNode(
    debugLabel: 'MyMenuButton',
  );
  var defaultColor = MyColors.red;
  // Контроллер для ввода с клавиатуры
  late ShortcutRegistryEntry myShortcut;

  // Объявление горячих клавиш
  static const SingleActivator redShortcut = SingleActivator(
    LogicalKeyboardKey.digit0,
    control: true,
  );
  static const SingleActivator greenShortcut = SingleActivator(
    LogicalKeyboardKey.digit1,
    control: true,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Регистрация горячих клавиш
    myShortcut = ShortcutRegistry.of(context)
        .addAll(<ShortcutActivator, VoidCallbackIntent>{
      redShortcut: VoidCallbackIntent(
        () => changeColor(MyColors.red),
      ),
      greenShortcut: VoidCallbackIntent(
        () => changeColor(MyColors.green),
      ),
    });
  }

  @override
  void dispose() {
    buttonFN.dispose();
    myShortcut.dispose();
    super.dispose();
  }

  void changeColor(MyColors? color) {
    setState(() {
      defaultColor = color!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            MenuAnchor(
              childFocusNode: buttonFN,
              menuChildren: [
                RadioMenuButton<MyColors>(
                  value: MyColors.red,
                  // Горячая клавиша для переключения цвета
                  shortcut: redShortcut,
                  groupValue: defaultColor,
                  onChanged: changeColor,
                  child: const Text('Red Background'),
                ),
                RadioMenuButton<MyColors>(
                  value: MyColors.green,
                  shortcut: greenShortcut,
                  groupValue: defaultColor,
                  onChanged: changeColor,
                  child: const Text('Green Background'),
                ),
              ],
              builder: (
                // Builder виджета MenuAnchor
                BuildContext context,
                MenuController controller,
                Widget? child,
              ) {
                return TextButton(
                  focusNode: buttonFN,
                  // обработчик нажатия на кнопку меню
                  onPressed: () {
                    // открытие/закрытие меню
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  child: const Text('Change Color'),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              color: enumToColor(defaultColor),
            ),
          ],
        ),
      ),
    );
  }
}
