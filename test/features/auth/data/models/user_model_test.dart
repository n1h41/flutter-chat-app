import 'dart:convert';

import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/domain/entitites/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late Map<String, dynamic> json;
  setUp(() {
    json = jsonDecode(readFixture('user_model.json'));
  });

  test('should be a subclass of User entity', () {
    final result = UserModel.fromJson(json);
    expect(result, isA<User>());
  });
}
