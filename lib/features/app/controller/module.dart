import 'package:chat_app/core/helpers/storage.dart';
import 'package:chat_app/features/app/controller/app_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appControllerProvider = Provider(
  (ref) {
    final Storage storage = Storage();
    return AppController(storage.prefs);
  },
);
