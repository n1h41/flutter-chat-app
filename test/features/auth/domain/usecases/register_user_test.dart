import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_user_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late RegisterUser usecase;
  late RegisterUserParams params;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = RegisterUser(mockAuthRepository);
    params = const RegisterUserParams(
      firstName: 'John',
      lastName: 'Doe',
      email: 'johndoe@gmail.com',
      password: 'password',
      passwordConfirmation: 'password',
    );
  });

  test(
      'should return a string saying "User registered" when registered successfully',
      () async {
    when(mockAuthRepository.registerUser(any))
        .thenAnswer((_) async => const Right("User created successfully"));

    final result = await usecase(params: params);

    expect(result, const Right("User created successfully"));

    verify(mockAuthRepository.registerUser(params));

    verifyNoMoreInteractions(mockAuthRepository);
  });
}
