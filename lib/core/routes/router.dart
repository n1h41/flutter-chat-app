import 'package:chat_app/core/routes/router_utils.dart';
import 'package:chat_app/features/app/controller/app_controller.dart';
import 'package:chat_app/features/auth/presentation/login/view/login_view.dart';
import 'package:chat_app/features/auth/presentation/register/view/registration_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/view/home_view.dart';

class AppRouter {
  AppRouter(this._controller);
  final AppController _controller;
  late final GoRouter _router = GoRouter(
    refreshListenable: _controller,
    initialLocation: APP_PAGES.homeView.routePath,
    routes: [
      GoRoute(
        name: APP_PAGES.registerView.routeName,
        path: APP_PAGES.registerView.routePath,
        builder: (context, state) => const RegistrationView(),
      ),
      GoRoute(
        name: APP_PAGES.loginView.routeName,
        path: APP_PAGES.loginView.routePath,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        name: APP_PAGES.homeView.routeName,
        path: APP_PAGES.homeView.routePath,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );

  GoRouter get router => _router;
}
