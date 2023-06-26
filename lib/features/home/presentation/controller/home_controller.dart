import 'package:chat_app/features/home/presentation/controller/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  build() {
    return const HomeState.initial();
  }

  Future<void> initiateWebSocketConnection() async {
  }
}
