import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../presentation/editor/editor_page.dart';
import '../presentation/main/main_page.dart';
import '../presentation/route_generator/router_page.dart';

part 'app_navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Screen')
class AppNavigation extends _$AppNavigation {
  final List<AutoRoute> routes = [
    AutoRoute(
      initial: true,
      page: MainScreen.page,
    ),
    AutoRoute(
      page: EditorScreen.page,
    ),
    AutoRoute(
      page: RouterScreen.page,
    ),
  ];
}
