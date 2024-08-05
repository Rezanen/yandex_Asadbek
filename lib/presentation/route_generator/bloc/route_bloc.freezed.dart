// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RouteState {
  RouteStt get status => throw _privateConstructorUsedError;
  List<MapObject> get mapObject => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteStateCopyWith<RouteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStateCopyWith<$Res> {
  factory $RouteStateCopyWith(
          RouteState value, $Res Function(RouteState) then) =
      _$RouteStateCopyWithImpl<$Res, RouteState>;
  @useResult
  $Res call({RouteStt status, List<MapObject> mapObject});
}

/// @nodoc
class _$RouteStateCopyWithImpl<$Res, $Val extends RouteState>
    implements $RouteStateCopyWith<$Res> {
  _$RouteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? mapObject = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStt,
      mapObject: null == mapObject
          ? _value.mapObject
          : mapObject // ignore: cast_nullable_to_non_nullable
              as List<MapObject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteStateImplCopyWith<$Res>
    implements $RouteStateCopyWith<$Res> {
  factory _$$RouteStateImplCopyWith(
          _$RouteStateImpl value, $Res Function(_$RouteStateImpl) then) =
      __$$RouteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RouteStt status, List<MapObject> mapObject});
}

/// @nodoc
class __$$RouteStateImplCopyWithImpl<$Res>
    extends _$RouteStateCopyWithImpl<$Res, _$RouteStateImpl>
    implements _$$RouteStateImplCopyWith<$Res> {
  __$$RouteStateImplCopyWithImpl(
      _$RouteStateImpl _value, $Res Function(_$RouteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? mapObject = null,
  }) {
    return _then(_$RouteStateImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStt,
      null == mapObject
          ? _value._mapObject
          : mapObject // ignore: cast_nullable_to_non_nullable
              as List<MapObject>,
    ));
  }
}

/// @nodoc

class _$RouteStateImpl implements _RouteState {
  const _$RouteStateImpl(this.status, final List<MapObject> mapObject)
      : _mapObject = mapObject;

  @override
  final RouteStt status;
  final List<MapObject> _mapObject;
  @override
  List<MapObject> get mapObject {
    if (_mapObject is EqualUnmodifiableListView) return _mapObject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mapObject);
  }

  @override
  String toString() {
    return 'RouteState(status: $status, mapObject: $mapObject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._mapObject, _mapObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_mapObject));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteStateImplCopyWith<_$RouteStateImpl> get copyWith =>
      __$$RouteStateImplCopyWithImpl<_$RouteStateImpl>(this, _$identity);
}

abstract class _RouteState implements RouteState {
  const factory _RouteState(
          final RouteStt status, final List<MapObject> mapObject) =
      _$RouteStateImpl;

  @override
  RouteStt get status;
  @override
  List<MapObject> get mapObject;
  @override
  @JsonKey(ignore: true)
  _$$RouteStateImplCopyWith<_$RouteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
