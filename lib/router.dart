import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_truck/fruit_detail.dart';
import 'package:one_truck/fruits.dart';
import 'package:one_truck/list.dart';
import 'package:one_truck/settings.dart';
import 'package:one_truck/work.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/list',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return HomeNavigationShell(
            navigationShell: navigationShell, hide:state.uri.pathSegments.length > 1);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/list',
              builder: (BuildContext context, GoRouterState state) =>
                  const ListPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/work',
              builder: (BuildContext context, GoRouterState state) =>
                  const WorkPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: "/fruits",
                builder: (context, state) {
                  return const FruitsPage();
                },
                routes: [
                  GoRoute(
                      path: "detail",
                      builder: (context, state) {
                        return const FruitDetailPage();
                      }),
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/settings',
              builder: (BuildContext context, GoRouterState state) =>
                  const SettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class HomeNavigationShell extends StatelessWidget {
  const HomeNavigationShell({
    required this.navigationShell,
    required this.hide,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ShellRoute'));

  final StatefulNavigationShell navigationShell;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    if (!hide) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Work'),
            BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Face'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => navigationShell.goBranch(index),
          type: BottomNavigationBarType.fixed,
        ),
      );
    } else {
      return Scaffold(
        body: navigationShell,
      );
    }
  }
}

