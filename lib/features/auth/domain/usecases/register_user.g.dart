// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'register_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterUserParams _$$_RegisterUserParamsFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterUserParams(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
    );

Map<String, dynamic> _$$_RegisterUserParamsToJson(
        _$_RegisterUserParams instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
    };
