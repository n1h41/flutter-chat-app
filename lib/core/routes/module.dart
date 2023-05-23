import 'package:chat_app/core/routes/router.dart';
import 'package:chat_app/features/app/controller/app_controller.dart';
import 'package:chat_app/features/app/controller/module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider<AppRouter>((ref) {
  final AppController controller = ref.watch(appControllerProvider);
  return AppRouter(controller);
});
