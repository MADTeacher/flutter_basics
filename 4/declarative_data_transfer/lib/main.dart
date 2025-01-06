import 'package:flutter/material.dart';

import 'router/my_route_config.dart';
import 'router/my_route_delegate.dart';
import 'router/my_route_information_parser.dart';
import 'router/my_route_information_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp.router(
      routerConfig: MyRouterConfig(
        routerDelegate: MyRouterDelegate(),
        routeInformationParser: MyRouteInformationParser(),
        routeInformationProvider: myRouteInformationProvider,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    ),
  );
}
