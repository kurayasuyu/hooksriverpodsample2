import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/data.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    //今回追加
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod counter example'),
      ),

      body: Center(
        /*　//元々あったソース
        child: Text(
          '$count',
          style: Theme.of(context).textTheme.headline4,
        ),
         */
        //今回追加
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              //onPressed: () {},//ボタン押した時に動く。今は何も入れていない。
              onPressed: () {
                ref.read(counterProvider.notifier).setIncrement(0);
              },
              child: const Text('Enabled'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}