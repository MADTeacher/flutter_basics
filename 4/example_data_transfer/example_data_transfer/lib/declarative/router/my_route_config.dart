import 'package:flutter/material.dart';

class MyRouterConfig<T> extends RouterConfig<T> {
  MyRouterConfig({
    required super.routerDelegate,
    required super.routeInformationParser,
    required super.routeInformationProvider,
    required super.backButtonDispatcher,
  });
}
