import 'package:meta/meta.dart';
import 'package:test_flow/src/flow_context.dart';
import 'package:test_flow/src/flow_test.dart';

/// Abstract base class for data flow providers.
///
/// Example:
/// ```dart
/// class MyFlowProvider extends FlowProvider<MyContext> {
///   // Implementation specific to MyFlowProvider.
/// }
/// ```
@immutable
abstract class FlowProvider<T extends FlowContext> {
  const FlowProvider();

  /// Method for executing a test with the given data flow.
  ///
  /// Example:
  /// ```dart
  /// final provider = MyFlowProvider();
  /// provider.execTest(myTestFlow);
  /// ```
  void execTest(FlowTest<T> testFlow);
}
