import 'package:chat_app/features/auth/domain/entitites/user.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/features/auth/domain/usecases/login_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUser usecase;
  late LoginUserParams params;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginUser(repository: mockAuthRepository);
    params = const LoginUserParams(
        email: 'nihalninu25@gmail.com', password: '12345678');
  });

  test(
      'should return a string saying "User logged in" when logged in successfully',
      () async {
    when(mockAuthRepository.loginUser(any))
        .thenAnswer((_) async => const Right(User()));

    final result = await usecase(params);

    expect(result, const Right(User()));

    verify(mockAuthRepository.loginUser(params));

    verifyNoMoreInteractions(mockAuthRepository);
  });
}
