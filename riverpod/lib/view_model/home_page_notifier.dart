import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/model/home_page_state.dart';

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier() : super(const HomePageState());

  void increaseMainCount() async {
    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  void increaseSubCount() async {
    state = state.copyWith(subCount: state.subCount + 1);
  }

  void resetAllCount() async {
    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
