// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_navigation.dart';

abstract class _$AppNavigation extends RootStackRouter {
  // ignore: unused_element
  _$AppNavigation({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EditorScreen.name: (routeData) {
      final args = routeData.argsAs<EditorScreenArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditorPage(
          key: args.key,
          lat: args.lat,
          lon: args.lon,
          str: args.str,
        ),
      );
    },
    MainScreen.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    RouterScreen.name: (routeData) {
      final args = routeData.argsAs<RouterScreenArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RouterPage(
          key: args.key,
          lat: args.lat,
          lon: args.lon,
        ),
      );
    },
  };
}

/// generated route for
/// [EditorPage]
class EditorScreen extends PageRouteInfo<EditorScreenArgs> {
  EditorScreen({
    Key? key,
    required double? lat,
    required double? lon,
    required String? str,
    List<PageRouteInfo>? children,
  }) : super(
          EditorScreen.name,
          args: EditorScreenArgs(
            key: key,
            lat: lat,
            lon: lon,
            str: str,
          ),
          initialChildren: children,
        );

  static const String name = 'EditorScreen';

  static const PageInfo<EditorScreenArgs> page =
      PageInfo<EditorScreenArgs>(name);
}

class EditorScreenArgs {
  const EditorScreenArgs({
    this.key,
    required this.lat,
    required this.lon,
    required this.str,
  });

  final Key? key;

  final double? lat;

  final double? lon;

  final String? str;

  @override
  String toString() {
    return 'EditorScreenArgs{key: $key, lat: $lat, lon: $lon, str: $str}';
  }
}

/// generated route for
/// [MainPage]
class MainScreen extends PageRouteInfo<void> {
  const MainScreen({List<PageRouteInfo>? children})
      : super(
          MainScreen.name,
          initialChildren: children,
        );

  static const String name = 'MainScreen';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RouterPage]
class RouterScreen extends PageRouteInfo<RouterScreenArgs> {
  RouterScreen({
    Key? key,
    required double lat,
    required double lon,
    List<PageRouteInfo>? children,
  }) : super(
          RouterScreen.name,
          args: RouterScreenArgs(
            key: key,
            lat: lat,
            lon: lon,
          ),
          initialChildren: children,
        );

  static const String name = 'RouterScreen';

  static const PageInfo<RouterScreenArgs> page =
      PageInfo<RouterScreenArgs>(name);
}

class RouterScreenArgs {
  const RouterScreenArgs({
    this.key,
    required this.lat,
    required this.lon,
  });

  final Key? key;

  final double lat;

  final double lon;

  @override
  String toString() {
    return 'RouterScreenArgs{key: $key, lat: $lat, lon: $lon}';
  }
}
