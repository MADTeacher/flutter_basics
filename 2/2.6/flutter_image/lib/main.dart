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

// перечисление для доступа к изображениям
enum MyImages {
  kandinsky1(url: 'images/kandinsky-1.png'),
  kandinsky2(url: 'images/kandinsky-2.png');

  final String url;
  const MyImages({required this.url});
}

class _MyHomePageState extends State<MyHomePage> {
  var image = MyImages.kandinsky1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // меняем изображение 
                  image = image == MyImages.kandinsky1
                      ? MyImages.kandinsky2
                      : MyImages.kandinsky1;
                });
              },
              child: const Text('Change image'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SizedBox(
                width: 500,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // добавляем изображение в виджет
                  child: Image.asset(
                    image.url,
                    // Указываем, как вписать изображение в отведенное 
                    // при пространство. BoxFit.cover - как можно
                    // меньше, но при этом охватывает всю целевую область.
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
