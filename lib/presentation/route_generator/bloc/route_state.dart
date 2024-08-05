part of 'route_bloc.dart';

@freezed
class RouteState with _$RouteState {
  const factory RouteState(
    RouteStt status,
    List<MapObject> mapObject,
  ) = _RouteState;
}

enum RouteStt { PLACECONFIRMED, CHANGINGPLACE, LOADING, INITIAL }
