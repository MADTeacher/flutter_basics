import 'package:flutter/material.dart';
import 'package:named_routes/app_routes_name.dart';
import 'package:named_routes/screens/default_screen.dart';
import 'package:named_routes/screens/home_screen.dart';
import 'package:named_routes/screens/login_screen.dart';
import 'package:named_routes/screens/main_screen.dart';
import 'package:named_routes/screens/profile_screen.dart';
import 'package:named_routes/screens/test_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      AppRoutesName.main: (context) => const MainScreen(),
      AppRoutesName.profile: (context) => const ProfileScreen(),
      AppRoutesName.login: (context) => const LoginScreen(),
      AppRoutesName.home: (context) => const HomeScreen(),
    },
    onUnknownRoute: (settings) => MaterialPageRoute(
      builder: (context) => const DefaultScreen(),
    ),
    onGenerateRoute: (settings) {
      /// Добавили проверку наличия аргументов при переходе
      if (settings.name == '/test') {
        final args = (settings.arguments as Map?)?['test'];
        if (args == true) {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        } else {
          return MaterialPageRoute(builder: (context) => const TestScreen());
        }
      }

      // В данном случае, в карте маршрутов routes
      // не прописан /test_route.
      // Но мы можем в onGenerateRoute, проверить, и построить нужный
      // маршрут.
      if (settings.name == '/test') {
        return MaterialPageRoute(builder: (context) => const TestScreen());
      }

      return null;
    },
  ));
}
