import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ornekler/todo/todo_provider.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  final _todoController = TextEditingController();

  void _listener() {
    if (kDebugMode) print('veri değişti');
  }

  @override
  void initState() {
    // Burada ve diğer yerlerde [ref] kullanabiliyoruz.
    // read methodu ile tek seferlik okuma yapabiliyoruz.
    if (kDebugMode) print(ref.read(todoProvider).todos);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Oluşturduğumuz provider nesnesinin değişikliklerini takip etmek ve
    // build methodunun yeniden çizilebilmesi için [watch] kullanıyoruz
    final todo = ref.watch(todoProvider);

    // Ayrıca providera bir listener atayabiliyoruz
    ref.listen(todoProvider, (previous, next) {
      // önceki ve sonraki değerleri görebiliyoruz
      _listener();
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todo.todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todo.todos[index]),
                  );
                },
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _todoController,
                    decoration:
                        const InputDecoration(hintText: 'Birşeyler yaz..'),
                  ),
                ),
                IconButton(
                  onPressed: () => todo.addItem(_todoController.text),
                  icon: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
