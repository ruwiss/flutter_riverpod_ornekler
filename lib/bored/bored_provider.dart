import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ornekler/bored/bored_model.dart';

class BoredProvider extends ChangeNotifier {
  String ornekData = "";

  void setOrnekData(String data) {
    ornekData = data;
    notifyListeners();
  }

  Future<FutureModel> veriGetir() async {
    final dio = Dio();
    final response = await dio.get('https://www.boredapi.com/api/activity');
    return FutureModel.fromJson(response.data);
  }
}

final boredProvider = ChangeNotifierProvider((ref) => BoredProvider());

// Veri yüklenirken, veri geldiğinde veya hata oluştuğunda
// Future provider ile görünümü daha kolay kontrol edebiliyoruz.
// StreamProvider'ın kullanımı da aynı şekilde
final boredFutureProvider = FutureProvider.autoDispose<FutureModel>((ref) {
  return ref.watch(boredProvider).veriGetir();
});
