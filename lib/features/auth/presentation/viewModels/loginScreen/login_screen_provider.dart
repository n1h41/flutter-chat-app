import '../../../domain/usecases/module.dart';
import 'login_screen_state.dart';
import 'login_screen_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginScreenNotifierProvider =
    StateNotifierProvider<LoginScreenStateNotifier, LoginScreenState>(
  (ref) => LoginScreenStateNotifier(
    ref.watch(loginUserProvider),
  ),
);
