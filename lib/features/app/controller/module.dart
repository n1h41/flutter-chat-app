import 'package:chat_app/core/helpers/storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_controller.dart';

final appControllerProvider = Provider(
  (ref) {
    final Storage storage = Storage();
    return AppController(storage.prefs);
  },
);
