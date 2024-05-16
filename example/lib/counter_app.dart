import 'package:flutter/material.dart';
import 'package:test_flow_example/auth_manager.dart';
import 'package:test_flow_example/router.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthManager(
      child: MaterialApp.router(
        routerConfig: router(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
