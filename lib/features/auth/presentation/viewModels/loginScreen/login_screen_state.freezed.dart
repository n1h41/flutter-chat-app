// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginScreenState {
  LoginScreenStateType? get stateType => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginScreenStateCopyWith<LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, $Res Function(LoginScreenState) then) =
      _$LoginScreenStateCopyWithImpl<$Res, LoginScreenState>;
  @useResult
  $Res call({LoginScreenStateType? stateType, Failure? error, User? user});
}

/// @nodoc
class _$LoginScreenStateCopyWithImpl<$Res, $Val extends LoginScreenState>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateType = freezed,
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      stateType: freezed == stateType
          ? _value.stateType
          : stateType // ignore: cast_nullable_to_non_nullable
              as LoginScreenStateType?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginScreenStateCopyWith<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  factory _$$_LoginScreenStateCopyWith(
          _$_LoginScreenState value, $Res Function(_$_LoginScreenState) then) =
      __$$_LoginScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginScreenStateType? stateType, Failure? error, User? user});
}

/// @nodoc
class __$$_LoginScreenStateCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res, _$_LoginScreenState>
    implements _$$_LoginScreenStateCopyWith<$Res> {
  __$$_LoginScreenStateCopyWithImpl(
      _$_LoginScreenState _value, $Res Function(_$_LoginScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateType = freezed,
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_LoginScreenState(
      stateType: freezed == stateType
          ? _value.stateType
          : stateType // ignore: cast_nullable_to_non_nullable
              as LoginScreenStateType?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$_LoginScreenState implements _LoginScreenState {
  const _$_LoginScreenState({this.stateType, this.error, this.user});

  @override
  final LoginScreenStateType? stateType;
  @override
  final Failure? error;
  @override
  final User? user;

  @override
  String toString() {
    return 'LoginScreenState(stateType: $stateType, error: $error, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginScreenState &&
            (identical(other.stateType, stateType) ||
                other.stateType == stateType) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateType, error, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginScreenStateCopyWith<_$_LoginScreenState> get copyWith =>
      __$$_LoginScreenStateCopyWithImpl<_$_LoginScreenState>(this, _$identity);
}

abstract class _LoginScreenState implements LoginScreenState {
  const factory _LoginScreenState(
      {final LoginScreenStateType? stateType,
      final Failure? error,
      final User? user}) = _$_LoginScreenState;

  @override
  LoginScreenStateType? get stateType;
  @override
  Failure? get error;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_LoginScreenStateCopyWith<_$_LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
