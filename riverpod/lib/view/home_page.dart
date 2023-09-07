import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/view_model/home_page_notifier.dart';

// 기존 StatelessWidget 대신 Riverpod의 ConsumerWidget을 상속받아 사용한다.
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // WidgetRef를 파라미터에 추가한다.
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 상태를 읽기 위해 사용
    final homePageState = ref.watch(homePageProvider);
    // 상태를 변경하기 위해 사용
    final homePageNotifier = ref.watch(homePageProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter MVVM')),
      floatingActionButton: FloatingActionButton(
        onPressed: homePageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Main Count ${homePageState.mainCount}'),
            onTap: homePageNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Sub Count ${homePageState.subCount}'),
            onTap: homePageNotifier.increaseSubCount,
          ),
        ],
      ),
    );
  }
}
