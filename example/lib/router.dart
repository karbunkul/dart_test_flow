import 'package:go_router/go_router.dart';
import 'package:test_flow_example/app_routes.dart';
import 'package:test_flow_example/auth_page.dart';
import 'package:test_flow_example/counter_page.dart';

import 'auth_manager.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final scope = AuthScope.of(context);

      if (state.matchedLocation == state.namedLocation(AppRoute.auth.name) &&
          scope.isAuthorized) {
        return state.namedLocation(AppRoute.counter.name);
      }

      if (!scope.isAuthorized) {
        return state.namedLocation(AppRoute.auth.name);
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.auth.name,
        pageBuilder: (_, __) => const NoTransitionPage(child: AuthPage()),
      ),
      GoRoute(
        path: '/counter',
        name: AppRoute.counter.name,
        pageBuilder: (_, __) => const NoTransitionPage(child: CounterPage()),
      ),
    ],
  );
}
