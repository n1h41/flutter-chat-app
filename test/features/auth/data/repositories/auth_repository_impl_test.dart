import 'package:chat_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepository repo;
  late RegisterUserParams params;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    repo = AuthRepositoryImpl(mockAuthRemoteDataSource);
    params = const RegisterUserParams(
      firstName: 'John',
      lastName: 'Doe',
      email: 'johndoe@gmail.com',
      password: 'password',
      confirmationPassword: 'password',
    );
  });

  test(
    "should return a string when valid params are passed to the register method",
    () async {
      when(mockAuthRemoteDataSource.register(any)).thenAnswer(
        (realInvocation) async => const Right("User created successfully"),
      );
      final result = await repo.registerUser(params);
      expect(result, const Right("User created successfully"));
    },
  );
}
