// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WebsocketState {
  bool get isConnected => throw _privateConstructorUsedError;
  Stream<dynamic>? get stream => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebsocketStateCopyWith<WebsocketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebsocketStateCopyWith<$Res> {
  factory $WebsocketStateCopyWith(
          WebsocketState value, $Res Function(WebsocketState) then) =
      _$WebsocketStateCopyWithImpl<$Res, WebsocketState>;
  @useResult
  $Res call({bool isConnected, Stream<dynamic>? stream});
}

/// @nodoc
class _$WebsocketStateCopyWithImpl<$Res, $Val extends WebsocketState>
    implements $WebsocketStateCopyWith<$Res> {
  _$WebsocketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? stream = freezed,
  }) {
    return _then(_value.copyWith(
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebsocketStateCopyWith<$Res>
    implements $WebsocketStateCopyWith<$Res> {
  factory _$$_WebsocketStateCopyWith(
          _$_WebsocketState value, $Res Function(_$_WebsocketState) then) =
      __$$_WebsocketStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isConnected, Stream<dynamic>? stream});
}

/// @nodoc
class __$$_WebsocketStateCopyWithImpl<$Res>
    extends _$WebsocketStateCopyWithImpl<$Res, _$_WebsocketState>
    implements _$$_WebsocketStateCopyWith<$Res> {
  __$$_WebsocketStateCopyWithImpl(
      _$_WebsocketState _value, $Res Function(_$_WebsocketState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? stream = freezed,
  }) {
    return _then(_$_WebsocketState(
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<dynamic>?,
    ));
  }
}

/// @nodoc

class _$_WebsocketState implements _WebsocketState {
  const _$_WebsocketState({this.isConnected = false, this.stream});

  @override
  @JsonKey()
  final bool isConnected;
  @override
  final Stream<dynamic>? stream;

  @override
  String toString() {
    return 'WebsocketState(isConnected: $isConnected, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebsocketState &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected, stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebsocketStateCopyWith<_$_WebsocketState> get copyWith =>
      __$$_WebsocketStateCopyWithImpl<_$_WebsocketState>(this, _$identity);
}

abstract class _WebsocketState implements WebsocketState {
  const factory _WebsocketState(
      {final bool isConnected,
      final Stream<dynamic>? stream}) = _$_WebsocketState;

  @override
  bool get isConnected;
  @override
  Stream<dynamic>? get stream;
  @override
  @JsonKey(ignore: true)
  _$$_WebsocketStateCopyWith<_$_WebsocketState> get copyWith =>
      throw _privateConstructorUsedError;
}
