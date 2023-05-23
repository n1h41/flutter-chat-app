import 'dart:convert';

import 'package:chat_app/core/helpers/secure_storage.dart';
import 'package:chat_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/login_user.dart';
import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, SecureStorage])
void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepository repo;
  late RegisterUserParams registerParams;
  late LoginUserParams loginParams;
  late MockSecureStorage mockStorage;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockStorage = MockSecureStorage();
    repo = AuthRepositoryImpl(mockAuthRemoteDataSource, mockStorage);
    registerParams = const RegisterUserParams(
      firstName: 'John',
      lastName: 'Doe',
      email: 'johndoe@gmail.com',
      password: 'password',
      passwordConfirmation: 'password',
    );
    loginParams = const LoginUserParams(
      email: 'nihalninu25@gmail.com',
      password: '12345678',
    );
  });

  test(
    "should return a string when valid params are passed to the register method",
    () async {
      when(mockAuthRemoteDataSource.register(any)).thenAnswer(
        (realInvocation) async => const Right("User created successfully"),
      );
      final result = await repo.registerUser(registerParams);
      expect(result, const Right("User created successfully"));
    },
  );

  test(
    'Should return access and refresh token\'s and a payload which contains the logged user details, when the user is successfully logged in',
    () async {
      final Map<String, dynamic> response = jsonDecode(
        fixture('login_user_response.json'),
      );
      when(mockAuthRemoteDataSource.login(any)).thenAnswer(
        (realInvocation) async => Right(response),
      );
      when(mockStorage.write(any, any)).thenAnswer(
        (realInvocation) async {},
      );
      final result = await repo.loginUser(loginParams);
      expect(result, Right(UserModel.fromJson(response['payload'])));
    },
  );
}
