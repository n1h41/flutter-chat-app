import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage? _instance;

  SecureStorage._() : _storage = const FlutterSecureStorage();

  static get instance {
    _instance ??= SecureStorage._();
    return _instance;
  }

  final FlutterSecureStorage _storage;

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    final value = await _storage.read(key: key);
    return value;
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
