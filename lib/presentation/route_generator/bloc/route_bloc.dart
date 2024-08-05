import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'route_bloc.freezed.dart';

part 'route_event.dart';

part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() : super(const RouteState(RouteStt.INITIAL, [])) {
    on<RouteEVRequestLocation>((_reqLocation));
    on<RouteEVBuildRoute>((_routeBuild));
  }

  _routeBuild(RouteEVBuildRoute event, Emitter<RouteState> emit) async {
    var resultWithSession = await YandexDriving.requestRoutes(
        points: event.points,
        drivingOptions: const DrivingOptions(
            initialAzimuth: 0, routesCount: 5, avoidTolls: true));

    DrivingSessionResult result = await resultWithSession.$2;
    List<MapObject> mapObjects = [];
    result.routes!.asMap().forEach((i, route) {
      mapObjects.add(PolylineMapObject(
        mapId: MapObjectId('route_${i}_polyline'),
        polyline: route.geometry,
        strokeColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        strokeWidth: 3,
      ));
    });
    emit(state.copyWith(mapObject: mapObjects));
  }

  _reqLocation(RouteEVRequestLocation event, Emitter<RouteState> emit) async {}
}
