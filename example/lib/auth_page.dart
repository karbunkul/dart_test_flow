import 'package:flutter/material.dart';
import 'package:test_flow_example/auth_manager.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: SizedBox(
                height: 250,
                child: Placeholder(),
              ),
            ),
            OutlinedButton(
              onPressed: AuthScope.of(context).login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
