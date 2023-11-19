import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ornekler/bored/bored_provider.dart';

class BoredPage extends ConsumerStatefulWidget {
  const BoredPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FuturePageState();
}

class _FuturePageState extends ConsumerState<BoredPage> {
  @override
  void initState() {
    ref.read(boredProvider).veriGetir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final boredFuture = ref.watch(boredFutureProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: boredFuture.when(
            loading: () => const Text('Yükleniyor'),
            error: (err, stack) => Text('Bir hata oluştu: $err'),
            data: (bored) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kategori: ${bored.type}'),
                const SizedBox(height: 20),
                Text('Ne Yapabilirsin?\n${bored.activity}'),
                const SizedBox(height: 20),
                Text('Gerekli kişi sayısı: ${bored.participants}'),
                const SizedBox(height: 20),
                Text('Maliyet: \$${bored.price}'),
                const SizedBox(height: 20),
                SelectableText(bored.link),

                // Refresh methoduyla tekrardan sıfırlama yaptık
                // Providerımız FutureProvider olduğu için veriyi tekrar aldı
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => ref.refresh(boredFutureProvider),
                    child: const Text('Sonraki'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
