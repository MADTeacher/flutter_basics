import 'package:flutter/material.dart';
import 'package:navigator_onserver/app_navigator_observer.dart';
import 'package:navigator_onserver/screens/main_screen.dart';

void main() {
  runApp(MaterialApp(
    navigatorObservers: [AppNavigatorObserver()],
    home: const MainScreen(),
  ));
}
