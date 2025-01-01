import 'package:example_data_transfer/declarative/router/my_route_config.dart';
import 'package:example_data_transfer/declarative/router/my_route_delegate.dart';
import 'package:example_data_transfer/declarative/router/my_route_information_parser.dart';
import 'package:example_data_transfer/declarative/router/my_route_information_provider.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp.router(
      routerConfig: MyRouterConfig(
          routerDelegate: MyRouterDelegate(),
          routeInformationParser: MyRouteInformationParser(),
          routeInformationProvider: myRouteInformationProvider,
          backButtonDispatcher: RootBackButtonDispatcher())));
}
