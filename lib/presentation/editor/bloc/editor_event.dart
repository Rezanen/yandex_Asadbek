part of 'editor_bloc.dart';

abstract class EditorEvent {}

class EditorEvAddLocation extends EditorEvent {

  final LocationData? locationData;
  EditorEvAddLocation(this.locationData);
}

class EditorEvDeleteLocation extends EditorEvent {
  final LocationData locationData;

  EditorEvDeleteLocation(this.locationData);
}
