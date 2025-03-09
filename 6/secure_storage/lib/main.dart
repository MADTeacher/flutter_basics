import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  final storage = FlutterSecureStorage(
    iOptions: IOSOptions(
      groupId: 'group.com.example.shared',
    ),
    mOptions: MacOsOptions(),
  );

  // Данные будут доступны во всех приложениях с таким же groupId
  await storage.write(key: 'access_token', value: 'qwerty...');
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.storage,
  });

  final FlutterSecureStorage storage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeWidget(storage: storage),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.storage});

  final FlutterSecureStorage storage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'asasassasas',
          ),
        ),
      ),
    );
  }
}


// Future<void> main() async {
//   final user1Storage = FlutterSecureStorage(
//     aOptions: AndroidOptions(
//       preferencesKeyPrefix: 'user_1_',
//       resetOnError: true,
//       keyCipherAlgorithm:
//           KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
//       storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
//     ),

//   );

//   final user2Storage = FlutterSecureStorage(
//     aOptions: AndroidOptions(preferencesKeyPrefix: 'user_2_'),
//   );

//   // Сохраняет по ключу user_1_email
//   await user1Storage.write(key: 'email', value: 'test@mail.ru');
//   // Сохраняет по ключу user_2_email
//   await user2Storage.write(key: 'email', value: 'test@gmail.com');
// }