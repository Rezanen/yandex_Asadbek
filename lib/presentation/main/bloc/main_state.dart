part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState(
    MainStt status,
    double? lat,
    double? long,
    String? placeName,
  ) = _MainState;
}

enum MainStt { PLACECONFIRMED, CHANGINGPLACE, LOADING, INITIAL }
