import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/view_model/home_page_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state（状態）
    final homePageState = ref.watch(homePageProvider);
    // provider（状態の操作）
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
