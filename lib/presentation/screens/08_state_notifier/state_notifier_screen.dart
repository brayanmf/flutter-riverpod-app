import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/todo.dart';
import '../../../providers/providers.dart';

final filteredGuestProvider=Provider<List<Todo>>((ref) {
final selectedFilter=ref.watch(todoFilterProvider);
final todos=ref.watch(todoListProvider);
switch(selectedFilter){
  case TodoFilter.all:
    return todos;
  case TodoFilter.complete:
    return todos.where((todo) => todo.done).toList();
  case TodoFilter.pending:
    return todos.where((todo) => !todo.done).toList();
}
});


class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //addListener escuchando cambios en el estado
          ref.read(todoListProvider.notifier).addTodo();
        },
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(todoFilterProvider);
    
    //final todos = ref.watch(todoListProvider);
    final todos = ref.watch(filteredGuestProvider);
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),
        SegmentedButton(
          segments: const [
            ButtonSegment(value: TodoFilter.all, icon: Text('Todos')),
            ButtonSegment(value: TodoFilter.complete, icon: Text('Invitados')),
            ButtonSegment(
                value: TodoFilter.pending, icon: Text('No invitados')),
          ],
          selected: <TodoFilter>{currentFilter},
          onSelectionChanged: (value) {
            ref
                .read(todoFilterProvider.notifier)
                .update((state) => value.first);
          },
        ),
        const SizedBox(height: 5),
       Expanded (
          child:ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todos[index];
            return SwitchListTile(
              title: Text(todo.description),
              value: todo.completedAt != null,
             onChanged: (value) {
             ref.read(todoListProvider.notifier).toggleTodo(
              todo.id
             );
                
             },
            );
          },
        )),
      ],
    );
  }
}
