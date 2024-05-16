import 'package:test_flow/test_flow.dart';

import 'increment_case.dart';
import 'logout_case.dart';

void main() {
  /// Example for using featureFlowTest, call all stories in feature
  final feature = FeatureFlow(
    summary: 'Counter logic',
    stories: [
      StoryFlow(
        summary: 'increment',
        cases: [
          CounterIncrementCase(),
          CounterLogoutCase(),
        ],
      ),
    ],
  );

  featureFlowTest(feature);

  /// Example for using storyFlowTest, call all test cases in story.
  // storyFlowTest(
  //   StoryFlow(
  //     summary: 'Counter tests',
  //     cases: [
  //       CounterIncrementCase(),
  //       CounterLogoutCase(),
  //     ],
  //   ),
  // );

  /// Example for using caseFlowTest, call custom test case(s)
  // group('Counter tests', () {
  //   caseFlowTest(CounterIncrementCase());
  //   caseFlowTest(CounterLogoutCase());
  // });
}
