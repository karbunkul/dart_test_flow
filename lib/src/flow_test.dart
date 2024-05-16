import 'dart:async';

import 'package:meta/meta.dart';
import 'package:test_flow/src/flow_context.dart';

/// Abstract base class for data flow tests.
///
/// Example:
/// ```dart
/// class MyTest extends FlowTest<MyContext> {
///   // Implementation specific to MyTest.
/// }
/// ```
@immutable
abstract class FlowTest<T extends FlowContext> {
  const FlowTest();

  /// Get a brief summary of the test.
  String get summary;

  /// Method to execute the test on the specified context.
  ///
  /// Example:
  /// ```dart
  /// final myContext = MyContext();
  /// await myTest.flow(myContext);
  /// ```
  Future<void> flow(T ctx);
}
