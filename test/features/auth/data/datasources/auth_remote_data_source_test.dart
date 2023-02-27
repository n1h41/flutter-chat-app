import 'package:chat_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSource;

  setUp(() {
    authRemoteDataSource = AuthRemoteDataSourceImpl();
  });

  test('Test the login funcitonality', () async {
    await authRemoteDataSource.register(const RegisterUserParams(
      email: 'test@gmail.com',
      firstName: 'test',
      lastName: 'test',
      password: '12345678',
      confirmationPassword: '12345678',
    ));
  });
}
