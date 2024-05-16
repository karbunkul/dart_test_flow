import 'package:test/test.dart';
import 'package:test_flow/src/case_flow.dart';

/// Class representing a flow of testing scenarios.
///
/// Example:
/// ```dart
/// final story = StoryFlow(
///   summary: 'Testing scenario summary',
///   cases: [myCase1, myCase2],
/// );
/// ```
base class StoryFlow {
  /// A brief description of the testing scenario.
  final String summary;

  /// List of test cases.
  final Iterable<CaseFlow> cases;

  const StoryFlow({
    required this.summary,
    required this.cases,
  });
}

void storyFlowTest(StoryFlow flow) {
  group(flow.summary, () {
    for (final caseFlow in flow.cases) {
      caseFlow.execTest();
    }
  });
}
