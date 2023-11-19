import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ornekler/counter/counter_provider.dart';

// Consumer Widget stateless kullanacağımızda extend ediliyor
// Stateful kullanacağımızda [ConsumerStatefulWidget] altına da [ConsumerState]
// extend ediliyor
class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Oluşturduğumuz provider nesnesinin değişikliklerini takip etmek ve
    // build methodunun yeniden çizilebilmesi için [watch] kullanıyoruz
    final counter = ref.watch(counterProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$counter', style: const TextStyle(fontSize: 40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => ref.read(counterProvider.notifier).increment(),
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () => ref.read(counterProvider.notifier).decrement(),
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
