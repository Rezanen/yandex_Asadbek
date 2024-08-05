import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/di/getIt.dart';
import '../../../common/network/main_api.dart';
import '../../../data/api/response/geocoder_resp.dart';

part 'main_bloc.freezed.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final _api = getIt.get<MainApi>();

  MainBloc()
      : super(const MainState(
          MainStt.INITIAL,
          null,
          null,
          "",
        )) {
    on<MainEvPointChanging>((_pointChanging));
    on<MainEvPointConfirmed>((_pointConfirmed));
  }

  _pointConfirmed(MainEvPointConfirmed event, Emitter<MainState> emit) async {
    final geoCoderResp = await _api.search(event.lat, event.long);
    GeoObject? geoObject = geoCoderResp
        ?.response?.geoObjectCollection?.featureMember
        ?.elementAt(0)
        .geoObject;
    if (true) {
      emit(state.copyWith(
          lat: event.lat,
          long: event.long,
          placeName: "${geoObject?.name} ${geoObject?.description}"));
    }
  }

  _pointChanging(MainEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(placeName: null));
  }
}
