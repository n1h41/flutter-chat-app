import 'package:chat_app/core/helpers/secure_storage.dart';
import 'package:chat_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:chat_app/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) {
    return HomeRepostoryImpl(SecureStorage.instance);
  },
);
