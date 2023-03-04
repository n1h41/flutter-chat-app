import 'package:chat_app/core/util/provider_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'core/util/router.dart';

void main() {
  runApp(ProviderScope(
    observers: [ProviderLogger(Logger())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => _Unfocus(child: child!),
      debugShowCheckedModeBanner: false,
      title: 'Chat application',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class _Unfocus extends ConsumerWidget {
  const _Unfocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
