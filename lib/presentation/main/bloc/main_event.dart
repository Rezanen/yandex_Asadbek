part of 'main_bloc.dart';

abstract class MainEvent {}

class MainEvPointChanging extends MainEvent {
  final double lat;
  final double long;

  MainEvPointChanging(this.lat, this.long);
}

class MainEvPointConfirmed extends MainEvent {
  final double lat;
  final double long;

  MainEvPointConfirmed(
    this.lat,
    this.long,
  );
}
