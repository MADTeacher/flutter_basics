import 'package:flutter/material.dart';
import 'package:route_api/example/my_route_information_parser.dart';
import 'package:route_api/example/my_route_information_provider.dart';
import 'package:route_api/example/my_route_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouteInformationParser(),
      routeInformationProvider: myRouteInformationProvider,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
