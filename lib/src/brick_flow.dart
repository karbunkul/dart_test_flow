import 'package:meta/meta.dart';
import 'package:test_flow/src/flow_context.dart';
import 'package:test_flow/src/flow_test.dart';

/// Abstract base class for test bricks.
///
/// Example:
/// ```dart
/// class MyBrick extends BrickFlow<MyContext> {
///   // Implementation specific to MyBrick.
/// }
/// ```
@immutable
abstract base class BrickFlow<T extends FlowContext> extends FlowTest<T> {
  const BrickFlow();
}
