import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_flow_example/counter_app.dart';

main() {
  group('Counter tests', () {
    testWidgets('Increment logic', (WidgetTester tester) async {
      await _makeTestableApp(tester);
      await _hasAuthorized(tester);

      expect(find.text('0'), findsOne);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOne);
    });

    testWidgets('App logout logic', (WidgetTester tester) async {
      await _makeTestableApp(tester);
      await _hasAuthorized(tester);

      final logoutFinder = find.byIcon(Icons.logout);
      expect(logoutFinder, findsOne);
      await tester.tap(logoutFinder);
      await tester.pump();
      expect(logoutFinder, findsNothing);
    });
  });
}

Future<void> _makeTestableApp(WidgetTester tester) async {
  await tester.pumpWidget(const CounterApp());
}

Future<void> _hasAuthorized(WidgetTester tester) async {
  await _hasAuthorized(tester);
  final loginFinder = find.text('Login');
  expect(loginFinder, findsOne);
  await tester.tap(loginFinder);
  await tester.pump();
  expect(loginFinder, findsNothing);
}
