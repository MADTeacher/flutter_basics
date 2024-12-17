import 'package:flutter/material.dart';
import 'package:route_api/example/my_route_config.dart';
import 'package:route_api/example/my_route_information_parser.dart';
import 'package:route_api/example/my_route_information_provider.dart';
import 'package:route_api/example/my_route_delegate.dart';

final RouterConfig<Object> myRouterConfig = MyRouterConfig<Object>(
  routerDelegate: MyRouterDelegate(),
  routeInformationParser: MyRouteInformationParser(),
  backButtonDispatcher: RootBackButtonDispatcher(),
  routeInformationProvider: myRouteInformationProvider,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: myRouterConfig,
    );
  }
}
