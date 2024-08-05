part of 'editor_bloc.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState(
    EditorStt status,
    LocationData? data,
  ) = _EditorState;
}

enum EditorStt { PLACECONFIRMED, CHANGINGPLACE, LOADING, INITIAL }
