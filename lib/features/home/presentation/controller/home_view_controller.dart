import 'package:chat_app/features/home/presentation/controller/state/home_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewController extends StateNotifier<HomeViewState> {
  HomeViewController() : super(const HomeViewState.initial());
}
