import 'package:chat_app/features/auth/presentation/screens/registeration_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: 'registration-screen',
      path: '/',
      builder: (context, state) => RegistrationScreen(),
    )
  ],
);
