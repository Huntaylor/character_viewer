import 'package:go_router/go_router.dart';
import 'package:simpson_viewer/domain/model/character_details_model.dart';
import 'package:simpson_viewer/presentation/pages/app_launch/app_launch.dart';
import 'package:simpson_viewer/presentation/pages/details/view/details_page.dart';
import 'package:simpson_viewer/presentation/pages/home/home.dart';
import 'package:simpson_viewer/routes/paths.dart';

final goRoutes = GoRouter(
  initialLocation: Paths.appLaunch.goRoute,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Paths.appLaunch.goRoute,
      builder: (_, __) => const AppLaunchPage(),
      routes: [
        GoRoute(
          builder: (_, __) => const HomePage(),
          path: Paths.appLaunch.home.goRoute,
          routes: [
            GoRoute(
              path: Paths.appLaunch.home.details.goRoute,
              builder: (_, state) {
                final details = state.extra as CharacterDetails?;
                return DetailsPage(
                  details: details!,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
