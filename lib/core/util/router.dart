import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/registeration_screen.dart';
import '../../features/auth/presentation/screens/user_verification_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'storage.dart';

final router = GoRouter(
  initialLocation: _getInitialRoute(),
  routes: [
    GoRoute(
        name: 'registrationScreen',
        path: '/registerUser',
        builder: (context, state) => const RegistrationScreen(),
        routes: [
          GoRoute(
            name: 'userVerificationScreen',
            path: 'verifyUser',
            builder: (context, state) => const UserVerificationScreen(),
          )
        ]),
    GoRoute(
      name: 'loginScreen',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'homeScreen',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

String _getInitialRoute() {
  final Storage storage = Storage();
  final String route =
      storage.getValue<bool?>("isLoggedIn") ?? false ? '/home' : '/login';
  return route;
}
