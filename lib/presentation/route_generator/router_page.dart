import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_asadbek/presentation/route_generator/bloc/route_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class RouterPage extends StatelessWidget {
  final double lat;
  final double lon;

  const RouterPage({super.key, required this.lat, required this.lon});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RouteBloc(), child: _RouterPageView(lat, lon));
  }
}

class _RouterPageView extends StatelessWidget {
  final double lat;
  final double lon;

  const _RouterPageView(this.lat, this.lon);

  Future<bool> get locationPermissionNotGranted async =>
      !(await Permission.location.request().isGranted);

  @override
  Widget build(BuildContext context) {
    late YandexMapController controller;
    final PlacemarkMapObject endPlacemark = PlacemarkMapObject(
      mapId: const MapObjectId('endPlacemark'),
      point: Point(latitude: lat, longitude: lon),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage('assets/route_start.png'),
          scale: 0.7)),
    );

    const animation =
        MapAnimation(type: MapAnimationType.smooth, duration: 2.0);
    GlobalKey mapKey = GlobalKey();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          await locationPermissionNotGranted;
          await controller.toggleUserLayer(
            visible: true,
          );
        },
        child: const Icon(
          size: 38,
          Icons.location_on_rounded,
          color: Colors.orange,
        ),
      ),
      appBar: AppBar(),
      body: BlocBuilder<RouteBloc, RouteState>(
          builder: (BuildContext context, RouteState state) {
        return Column(
          children: [
            Flexible(
              flex: 1,
              child: YandexMap(
                  mapObjects: state.mapObject,
                  key: mapKey,
                  onMapCreated:
                      (YandexMapController yandexMapController) async {
                    controller = yandexMapController;
                  },
                  onUserLocationAdded: (UserLocationView view) async {
                    CameraPosition? position =
                        await controller.getUserCameraPosition();
                    if (position != null) {
                      await controller.moveCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: position.target)),
                          animation: animation);
                      context.read<RouteBloc>().add(RouteEVBuildRoute([
                            RequestPoint(
                                point: position.target,
                                requestPointType: RequestPointType.wayPoint),
                            RequestPoint(
                                point: endPlacemark.point,
                                requestPointType: RequestPointType.wayPoint),
                          ]));


                    }

                    return view.copyWith(
                      pin: view.pin.copyWith(
                        icon: PlacemarkIcon.single(
                          PlacemarkIconStyle(
                            image: BitmapDescriptor.fromAssetImage(
                                'assets/route_stop_by.png'),
                          ),
                        ),
                      ),
                      arrow: view.arrow.copyWith(
                          icon: PlacemarkIcon.single(PlacemarkIconStyle(
                              image: BitmapDescriptor.fromAssetImage(
                                  'assets/route_stop_by.png')))),
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }
}
