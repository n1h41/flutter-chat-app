import 'package:chat_app/core/routes/module.dart';
import 'package:chat_app/core/routes/router.dart';
import 'package:chat_app/core/theme/app_theme.dart';
import 'package:chat_app/features/app/controller/module.dart';
import 'package:chat_app/features/home/presentation/controller/home_controller.dart';
import 'package:chat_app/features/home/presentation/controller/websocket_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatApp extends HookConsumerWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = ref.watch(routerProvider);
    ref.listen(websocketControllerProvider, (_, next) {
      debugPrint("Value changed");
    });
    useEffect(
      () {
        ref.read(appControllerProvider).init();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          if (ref.read(appControllerProvider).loginState) {
            await ref
                .read(homeControllerProvider.notifier)
                .initiateWebSocketConnection();
          }
        });
        return null;
      },
      const [],
    );
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          builder: (context, child) => _Unfocus(child: child!),
          debugShowCheckedModeBanner: false,
          title: 'Chat application',
          theme: lightTheme,
          routerConfig: appRouter.router,
        );
      },
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
