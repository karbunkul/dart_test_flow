import 'package:flutter/material.dart';

import '../../app_context.dart';

final class CounterLogoutCase extends UnitCaseFlow {
  @override
  Future<void> flow(AppContext ctx) async {
    await ctx.hasAuthorized();
    final logoutFinder = find.byIcon(Icons.logout);
    expect(logoutFinder, findsOne);
    await ctx.tapAndPump(logoutFinder);
    expect(logoutFinder, findsNothing);
  }

  @override
  String get summary => 'App logout logic';
}
