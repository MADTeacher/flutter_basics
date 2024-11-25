import 'package:flutter/material.dart';
import 'package:named_routes/app_routes_name.dart';
import 'package:named_routes/screens/default_screen.dart';
import 'package:named_routes/screens/home_screen.dart';
import 'package:named_routes/screens/login_screen.dart';
import 'package:named_routes/screens/main_screen.dart';
import 'package:named_routes/screens/profile_screen.dart';

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
  ));
}
