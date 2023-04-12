// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterUserParams _$RegisterUserParamsFromJson(Map<String, dynamic> json) {
  return _RegisterUserParams.fromJson(json);
}

/// @nodoc
mixin _$RegisterUserParams {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirmation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterUserParamsCopyWith<RegisterUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserParamsCopyWith<$Res> {
  factory $RegisterUserParamsCopyWith(
          RegisterUserParams value, $Res Function(RegisterUserParams) then) =
      _$RegisterUserParamsCopyWithImpl<$Res, RegisterUserParams>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String passwordConfirmation});
}

/// @nodoc
class _$RegisterUserParamsCopyWithImpl<$Res, $Val extends RegisterUserParams>
    implements $RegisterUserParamsCopyWith<$Res> {
  _$RegisterUserParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterUserParamsCopyWith<$Res>
    implements $RegisterUserParamsCopyWith<$Res> {
  factory _$$_RegisterUserParamsCopyWith(_$_RegisterUserParams value,
          $Res Function(_$_RegisterUserParams) then) =
      __$$_RegisterUserParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String passwordConfirmation});
}

/// @nodoc
class __$$_RegisterUserParamsCopyWithImpl<$Res>
    extends _$RegisterUserParamsCopyWithImpl<$Res, _$_RegisterUserParams>
    implements _$$_RegisterUserParamsCopyWith<$Res> {
  __$$_RegisterUserParamsCopyWithImpl(
      _$_RegisterUserParams _value, $Res Function(_$_RegisterUserParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
  }) {
    return _then(_$_RegisterUserParams(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterUserParams implements _RegisterUserParams {
  const _$_RegisterUserParams(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.passwordConfirmation});

  factory _$_RegisterUserParams.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterUserParamsFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirmation;

  @override
  String toString() {
    return 'RegisterUserParams(firstName: $firstName, lastName: $lastName, email: $email, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterUserParams &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, email, password, passwordConfirmation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterUserParamsCopyWith<_$_RegisterUserParams> get copyWith =>
      __$$_RegisterUserParamsCopyWithImpl<_$_RegisterUserParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterUserParamsToJson(
      this,
    );
  }
}

abstract class _RegisterUserParams implements RegisterUserParams {
  const factory _RegisterUserParams(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String password,
      required final String passwordConfirmation}) = _$_RegisterUserParams;

  factory _RegisterUserParams.fromJson(Map<String, dynamic> json) =
      _$_RegisterUserParams.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get passwordConfirmation;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterUserParamsCopyWith<_$_RegisterUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}
