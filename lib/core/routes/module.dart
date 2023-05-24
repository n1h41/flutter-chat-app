import 'package:chat_app/core/routes/router.dart';
import 'package:chat_app/features/app/controller/module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
AppRouter router(RouterRef ref) {
  return AppRouter(ref.read(appControllerProvider));
}

/* final routerProvider = Provider<AppRouter>((ref) {
  final AppController controller = ref.watch(appControllerProvider);
  return AppRouter(controller);
}); */
