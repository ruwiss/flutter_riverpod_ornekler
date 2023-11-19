import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterProvider extends StateNotifier<int> {
  // Tekil provider oluşturup başlangıç değerini 0 olarak ayarladık.
  CounterProvider() : super(0);

  // Integer değerimizi arttırma
  void increment() => state++;

  // Integer değerimizi azaltma
  void decrement() => state--;
}

// Dışarıda kullanmak için üstte tanımladığımız
// providerdan bir nesne oluşturuyoruz.
final counterProvider =
    StateNotifierProvider<CounterProvider, int>((ref) => CounterProvider());

/* 

- [autoDispose] ile, widget dispose olduğunda tüm veriler sıfırlanır

final counterProvider = providerCesidi
    .autoDispose<CounterProvider, int>((ref) => CounterProvider());

- [family] ile, her çağrıldığında yeni bir nesne döndürür.
- Aynı nesne ile çağırırsan o nesneye ait değerleri saklar.

final counterProvider = StateNotifierProvider.family<OrnekProvider, nesne>(
    (ref) => OrnekProvider()); 
    
*/
