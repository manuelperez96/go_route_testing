import 'package:go_route_testing/view/normal_example/home_page.dart';
import 'package:go_route_testing/view/normal_example/profile_page.dart';
import 'package:go_route_testing/view/normal_example/setting_page.dart';
import 'package:go_route_testing/view/shared_bloc_example/view/splash_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home/:name',
          name: 'home',
          builder: (context, state) {
            final name = state.pathParameters['name'] ?? '';
            return HomePage(name: name);
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'setting',
              name: 'setting',
              builder: (context, state) {
                return const SettingPage();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) {
        return const ProfilePage();
      },
    ),
  ],
);
