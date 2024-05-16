import 'package:flutter/material.dart';

import '../../app_context.dart';

final class CounterIncrementCase extends UnitCaseFlow {
  @override
  Future<void> flow(AppContext ctx) async {
    // We must be authorized
    await ctx.hasAuthorized();
    // Initial counter state is zero
    expect(find.text('0'), findsOne);
    // Find FAB and tap it.

    await ctx.tapAndPump(find.byIcon(Icons.add));

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOne);
  }

  @override
  String get summary => 'Increment logic';
}
