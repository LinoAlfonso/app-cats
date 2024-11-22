
import 'package:go_router/go_router.dart';

import '../../features/feature_cats/feature_cats.dart';
import '../../features/feature_on_boarding/feature_on_boarding.dart';

final routesApp = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: SplashView.routeName,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/home-view',
      name: HomeCatsView.nameView,
      builder: (context, state) => const HomeCatsView(),
    )
  ],
);