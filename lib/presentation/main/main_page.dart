import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_asadbek/navigation/app_navigation.dart';
import 'package:yandex_asadbek/presentation/main/bloc/main_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => MainBloc(), child: _MainPageView());
  }
}

class _MainPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late YandexMapController controller;
    const MapObjectId targetMapObjectId = MapObjectId('target_placemark');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          BlocBuilder<MainBloc, MainState>(
              builder: (BuildContext context, MainState state) {
            return GestureDetector(
                onTap: () {
                  context.pushRoute(EditorScreen(
                      lat: state.lat, lon: state.long, str: state.placeName));
                },
                child: const Icon(Icons.save));
          })
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (BuildContext context, MainState state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Ketish Manzili",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  child: state.placeName != null
                      ? Text(state.placeName!)
                      : Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 200,
                            height: 40,
                          )),
                ),
              ),
              Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    YandexMap(
                      onMapCreated:
                          (YandexMapController yandexMapController) async {
                        controller = yandexMapController;
                      },
                      onCameraPositionChanged: (CameraPosition cameraPosition,
                          CameraUpdateReason reason, bool finished) async {
                        context.read<MainBloc>().add(MainEvPointChanging(
                            cameraPosition.target.latitude,
                            cameraPosition.target.longitude));
                        if (finished) {
                          await Future.delayed(const Duration(seconds: 1));
                          context.read<MainBloc>().add(
                                MainEvPointConfirmed(
                                  cameraPosition.target.latitude,
                                  cameraPosition.target.longitude,
                                ),
                              );
                        }
                      },
                    ),
                    Positioned(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage(state.placeName != null
                              ? "assets/route_start.png"
                              : "assets/route_end.png"),
                          width: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              state.placeName != null
                  ? GestureDetector(
                      onTap: () {
                        if (state.lat != null) {
                          context.pushRoute(
                              RouterScreen(lat: state.lat!, lon: state.long!));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text("Tasdiqlash"),
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        height: 40,
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
