part of 'route_bloc.dart';

abstract class RouteEvent {}

class RouteEVRequestLocation extends RouteEvent {}

class RouteEVBuildRoute extends RouteEvent {
  final List<RequestPoint> points;

  RouteEVBuildRoute(this.points);
}
