import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/model/home_page_state.dart';

// View와 Model을 연결하는 역할을 담당하는 View Model작성

// Notifier란? : 상태를 변경하고 상태 변경을 감지하는 데 사용되며, 일반적으로 상태를 관리하는 클래스를 나타낸다.
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

// Provider 생성
final homePageProvider =
    // autoDispose: 이 Provider가 더 이상 사용되지 않을 때 자동으로 해당 Provider와 관련된 자원을 해제(dispose)하도록 설정
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
