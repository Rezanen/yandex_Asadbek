import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:yandex_asadbek/data/hive/locationData.dart';

import '../../../common/di/getIt.dart';
import '../../../common/network/main_api.dart';
import '../../../data/api/response/geocoder_resp.dart';

part 'editor_bloc.freezed.dart';

part 'editor_event.dart';

part 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  final _box = getIt.get<Box>();
  List<LocationData> _location = List.empty();

  EditorBloc() : super(const EditorState(EditorStt.INITIAL, null)) {
    on<EditorEvDeleteLocation>((_delete));
    on<EditorEvAddLocation>((_add));
  }



  _add(EditorEvAddLocation event, Emitter<EditorState> emit) async {
    if(event.locationData!=null){
      _box.clear();
      _box.add(event.locationData);
    }

    _location = _box.values.map((e) => e as LocationData).toList();
    emit(state.copyWith(data: _location.isNotEmpty ? _location[0] : null));
  }

  _delete(EditorEvDeleteLocation event, Emitter<EditorState> emit) async {
    _box.clear();
    emit(state.copyWith(data:null));
  }
}
