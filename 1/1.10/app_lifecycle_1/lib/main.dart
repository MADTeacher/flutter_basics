import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const AppLifecycle());
}

class AppLifecycle extends StatelessWidget {
  const AppLifecycle({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: AppLifecycleWidget(),
      ),
    );
  }
}

class AppLifecycleWidget extends StatefulWidget {
  const AppLifecycleWidget({super.key});

  @override
  State<AppLifecycleWidget> createState() => _AppLifecycleWidgetState();
}

class _AppLifecycleWidgetState extends State<AppLifecycleWidget> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    // получение текущего состояния приложения
    var state = SchedulerBinding.instance.lifecycleState;
    debugPrint('AppLifecycleDisplay init: ${state?.name}');
    _listener = AppLifecycleListener(
      onResume: () => _handleEvent('resume'),
      onInactive: () => _handleEvent('inactive'),
      onHide: () => _handleEvent('hide'),
      onShow: () => _handleEvent('show'),
      onPause: () => _handleEvent('pause'),
      onRestart: () => _handleEvent('restart'),
      onDetach: () => _handleEvent('detach'),
      onExitRequested: () => _handleExit(),
      onStateChange: _handleStateChange,
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    debugPrint('AppLifecycleDisplay disposed');
    super.dispose();
  }

  Future<AppExitResponse> _handleExit() async {
    debugPrint('AppLifecycleDisplay exiting');
    return AppExitResponse.exit;
  }

  void _handleEvent(String name) {
    debugPrint('Callback: $name');
    setState(() {});
  }

  void _handleStateChange(AppLifecycleState state) {
    debugPrint('State change: ${state.name}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
