import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_flow/test_flow.dart';
import 'package:test_flow_example/counter_app.dart';

import 'bricks/auth_brick.dart';

export 'package:flutter_test/flutter_test.dart';

/// FlowContext for testing counter app
final class AppContext extends FlowContext {
  @protected
  final WidgetTester tester;

  const AppContext({
    required this.tester,
  });

  /// Provide fake login process, before check user is not authenticated
  Future<void> hasAuthorized() {
    return runBrick(AuthFlowBrick());
  }

  /// Combine tap and pump
  Future<void> tapAndPump(Finder finder) async {
    await tester.tap(finder);
    await tester.pump();
  }
}

final class AppFlowProvider extends FlowProvider<AppContext> {
  @override
  void execTest(FlowTest<FlowContext> flow) {
    testWidgets(flow.summary, ($) async {
      /// Setup for everyone test case
      await $.pumpWidget(const CounterApp());

      return flow.flow(
        AppContext(tester: $),
      );
    });
  }
}

/// Counter brick flow
abstract base class UnitBrickFlow extends BrickFlow<AppContext> {}

/// Counter case flow
abstract base class UnitCaseFlow extends CaseFlow<AppContext> {
  @override
  AppFlowProvider get flowProvider => AppFlowProvider();
}
