import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:test_task/core/di/presentation_di.dart';
import 'package:test_task/features/home_navigation/app_navigation_bar.dart';
import 'package:test_task/features/list/presentation/screens/list_screen.dart';

import '../../features/list/domain/list_character.dart';
import '../../features/random_character/presentation/screens/home_screen.dart';
import '../../features/list/presentation/screens/info_screen.dart';
import '../../features/splash/splash_screen.dart';

final _routerKey = GlobalKey<NavigatorState>();
final _homeKey = GlobalKey<NavigatorState>();

const _appNavigationBar = AppNavigationBar();

final GoRouter router = GoRouter(
  navigatorKey: _routerKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _routerKey,
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      navigatorKey: _homeKey,
      pageBuilder: (context, state, child) => NoTransitionPage(child: child),
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          parentNavigatorKey: _homeKey,
          path: AppRoute.home.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeScreen(bottomNavigationBar: _appNavigationBar)),
        ),
        GoRoute(
          parentNavigatorKey: _homeKey,
          path: AppRoute.list.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ListScreenDI(child: ListScreen(bottomNavigationBar: _appNavigationBar))),
        ),
        GoRoute(
          parentNavigatorKey: _homeKey,
          path: AppRoute.info.path,
          builder: (context, state) => InfoScreen(
            character: state.extra as CharacterListData,
          ),
        ),
      ],
    ),
  ],
);

enum AppRoute {
  splash('/'),
  home('/home'),
  list('/list'),
  info('/info');

  const AppRoute(this.path);

  final String path;

  static AppRoute fromPath(String path) {
    for (final route in AppRoute.values) {
      if (route.path == path) return route;
    }
    throw Exception('Route not found');
  }

  static AppRoute getCurrentRoute(BuildContext context) {
    final path = GoRouter.of(context).routeInformationProvider.value.uri.path;
    return AppRoute.fromPath(path);
  }
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context, {extra}) => context.go(path, extra: extra);

  Future<T?> push<T>(BuildContext context, {extra}) => context.push<T>(path, extra: extra);
}
