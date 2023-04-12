import 'package:chat_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/domain/usecases/login_user.dart';
import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSource;

  setUp(() {
    authRemoteDataSource = AuthRemoteDataSourceImpl();
  });

  test('Test the user register funcitonality', () async {
    await authRemoteDataSource.register(const RegisterUserParams(
      email: 'nihalninu25@gmail.com',
      firstName: 'Nihal',
      lastName: 'Abdulla',
      password: '12345678',
      passwordConfirmation: '12345678',
    ));
  });

  test('Test the user login functionality', () async {
    await authRemoteDataSource.login(
      const LoginUserParams(
        email: 'nihalninu25@gmail.com',
        password: '12345678',
      ),
    );
  });
}
