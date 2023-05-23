import 'package:chat_app/core/theme/app_theme.dart';
import 'package:chat_app/core/helpers/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'core/helpers/provider_logger.dart';
import 'features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage().init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: lightTheme.scaffoldBackgroundColor,
    ),
  );
  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(
          Logger(),
        ),
      ],
      child: const ChatApp(),
    ),
  );
}
