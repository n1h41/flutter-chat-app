// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginUserParams _$LoginUserParamsFromJson(Map<String, dynamic> json) {
  return _LoginUserParams.fromJson(json);
}

/// @nodoc
mixin _$LoginUserParams {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginUserParamsCopyWith<LoginUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUserParamsCopyWith<$Res> {
  factory $LoginUserParamsCopyWith(
          LoginUserParams value, $Res Function(LoginUserParams) then) =
      _$LoginUserParamsCopyWithImpl<$Res, LoginUserParams>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginUserParamsCopyWithImpl<$Res, $Val extends LoginUserParams>
    implements $LoginUserParamsCopyWith<$Res> {
  _$LoginUserParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginUserParamsCopyWith<$Res>
    implements $LoginUserParamsCopyWith<$Res> {
  factory _$$_LoginUserParamsCopyWith(
          _$_LoginUserParams value, $Res Function(_$_LoginUserParams) then) =
      __$$_LoginUserParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LoginUserParamsCopyWithImpl<$Res>
    extends _$LoginUserParamsCopyWithImpl<$Res, _$_LoginUserParams>
    implements _$$_LoginUserParamsCopyWith<$Res> {
  __$$_LoginUserParamsCopyWithImpl(
      _$_LoginUserParams _value, $Res Function(_$_LoginUserParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginUserParams(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginUserParams implements _LoginUserParams {
  const _$_LoginUserParams({required this.email, required this.password});

  factory _$_LoginUserParams.fromJson(Map<String, dynamic> json) =>
      _$$_LoginUserParamsFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginUserParams(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginUserParams &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginUserParamsCopyWith<_$_LoginUserParams> get copyWith =>
      __$$_LoginUserParamsCopyWithImpl<_$_LoginUserParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginUserParamsToJson(
      this,
    );
  }
}

abstract class _LoginUserParams implements LoginUserParams {
  const factory _LoginUserParams(
      {required final String email,
      required final String password}) = _$_LoginUserParams;

  factory _LoginUserParams.fromJson(Map<String, dynamic> json) =
      _$_LoginUserParams.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginUserParamsCopyWith<_$_LoginUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}
