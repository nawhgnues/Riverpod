import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

// 데이터 정의
@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(0) int mainCount,
    @Default(0) int subCount,
  }) = _HomePageState;
}

// 코드 작성 후
// flutter pub run build_runner watch --delete-conflicting-outputs 커맨드 이용하여 freezed 파일 생성