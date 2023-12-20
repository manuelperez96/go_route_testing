import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_route_testing/view/shared_bloc_example/bloc/user_bloc.dart';
import 'package:go_route_testing/view/shared_bloc_example/view/name_page.dart';
import 'package:go_route_testing/view/shared_bloc_example/view/signup_page.dart';
import 'package:go_route_testing/view/shared_bloc_example/view/splash_page.dart';

import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey2 =
    GlobalKey<NavigatorState>(debugLabel: 'rootcubit');

final GlobalKey<NavigatorState> shellNavigatorKey2 =
    GlobalKey<NavigatorState>(debugLabel: 'shellCubit');

final routerBloc = GoRouter(
  navigatorKey: rootNavigatorKey2,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashPage();
      },
      routes: [
        ShellRoute(
          navigatorKey: shellNavigatorKey2,
          builder: (context, state, child) {
            return BlocProvider(
              create: (context) => UserBloc(),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: 'signup',
              builder: (context, state) => const SingupPage(),
              routes: [
                GoRoute(
                  path: 'name',
                  builder: (context, state) => const NamePage(),
                )
              ],
            )
          ],
        ),
      ],
    ),
  ],
);
