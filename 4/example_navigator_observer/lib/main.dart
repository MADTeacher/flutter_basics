import 'package:example_navigator_observer/app_navigator_observer.dart';
import 'package:example_navigator_observer/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      navigatorObservers: [AppNavigatorObserver()],
      home: const MainScreen(),
    ),
  );
}
