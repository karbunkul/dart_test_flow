import 'dart:async';

import 'package:meta/meta.dart';
import 'package:test_flow/src/brick_flow.dart';
import 'package:test_flow/src/flow_test.dart';

/// Abstract base class for data flow context.
///
/// Example:
/// ```dart
/// class MyContext extends FlowContext {
///   // Implementation specific to MyContext.
/// }
/// ```
@immutable
abstract class FlowContext {
  const FlowContext();

  Future<void> runBrick(BrickFlow brick) async {
    _brickRecursiveCallDetect(brick);
    await brick.flow(this);
  }

  void _brickRecursiveCallDetect(FlowTest brick) {
    final st = StackTrace.current.toString();
    final items = <String>[];

    final regex = RegExp(r'#\d+\s+(\w+\.\w+)');
    final matches = regex.allMatches(st);

    for (final match in matches) {
      final method = match.group(1);
      if (method != null) {
        items.add(method);
      }
    }

    if (items.length >= 500) {
      final uniqueItems = items.toSet();
      final percent = (uniqueItems.length * 100) / items.length;

      if (percent < 1 && uniqueItems.contains('${brick.runtimeType}.flow')) {
        throw ArgumentError('Recursive brick call detect ${brick.runtimeType}');
      }
    }
  }
}
