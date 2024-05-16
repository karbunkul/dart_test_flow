import 'package:test/test.dart';
import 'package:test_flow/src/story_flow.dart';

/// Class representing a flow of functionality or feature.
///
/// Example:
/// ```dart
/// final feature = FeatureFlow(
///   summary: 'Feature summary',
///   stories: [story1, story2],
/// );
/// ```
base class FeatureFlow {
  /// A brief description of the feature.
  final String summary;

  /// List of testing scenarios.
  final Iterable<StoryFlow> stories;

  FeatureFlow({
    required this.summary,
    required this.stories,
  });
}

void featureFlowTest(FeatureFlow flow) {
  group(flow.summary, () {
    for (final story in flow.stories) {
      group(story.summary, () {
        for (final caseTest in story.cases) {
          caseTest.execTest();
        }
      });
    }
  });
}
