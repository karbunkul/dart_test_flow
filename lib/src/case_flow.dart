import 'dart:async';

import 'package:meta/meta.dart';
import 'package:test_flow/src/flow_context.dart';
import 'package:test_flow/src/flow_provider.dart';
import 'package:test_flow/src/flow_test.dart';

/// Abstract base class for test cases.
///
/// Example:
/// ```dart
/// class MyCase extends CaseFlow<MyContext> {
///   // Implementation specific to MyCase.
/// }
/// ```
@immutable
abstract class CaseFlow<T extends FlowContext> extends FlowTest<T> {
  const CaseFlow();

  /// Get the flow provider for this test case.
  FlowProvider<T> get flowProvider;

  /// Method to execute the test.
  ///
  /// Example:
  /// ```dart
  /// final myCase = MyCase();
  /// await myCase.execTest();
  /// ```
  FutureOr<void> execTest() async {
    await flowProvider.execTest(this);
  }
}

void caseFlowTest(CaseFlow flow) {
  flow.flowProvider.execTest(flow);
}
