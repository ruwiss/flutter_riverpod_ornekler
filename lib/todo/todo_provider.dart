import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider sınıfımızı oluşturuyoruz
class TodoProvider extends ChangeNotifier {
  final List<String> _todos = [];

  List<String> get todos => _todos;

  void addItem(String item) {
    _todos.add(item);
    notifyListeners();
  }
}

// Oluşturduğumuz provider sınıfından widgetlarda
// kullanmak üzere yeni bir nesne türetiyoruz
final todoProvider = ChangeNotifierProvider((ref) => TodoProvider());
