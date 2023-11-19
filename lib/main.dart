import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ornekler/counter/counter.dart';
import 'package:flutter_riverpod_ornekler/bored/bored.dart';
import 'package:flutter_riverpod_ornekler/todo/todo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/counter': (context) => const CounterPage(),
          '/todo': (context) => const TodoPage(),
          '/bored': (context) => const BoredPage(),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/counter'),
                child: const Text('Counter')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/todo'),
                child: const Text('Todo')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/bored'),
                child: const Text('Bored')),
          ],
        ),
      ),
    );
  }
}
