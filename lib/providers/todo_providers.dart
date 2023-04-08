
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
enum TodoFilter {all,complete,pending}

final todoFilterProvider = StateProvider<TodoFilter>((ref) {
  return  TodoFilter.all;
});
final todosProvider = StateProvider<List<Todo>>((ref) {
  return [
    Todo(
      id:uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null,
    ),   Todo(
      id:uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: DateTime.now(),
    ),   Todo(
      id:uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null,
    ),   Todo(
      id:uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: DateTime.now(),
    ),   Todo(
      id:uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: DateTime.now(),
    ),   Todo(
      id:uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null,
    )
   ] ;
});

final filterdTodosProvider=Provider((ref) {
  // se vuelve a ejecutar cuando cambia el filtro o la lista de todos watch
  final filter=ref.watch(todoFilterProvider);
  final todos=ref.watch(todosProvider);
  switch(filter){
    case TodoFilter.all:
      return todos;
    case TodoFilter.complete:
      return todos.where((todo) => todo.done).toList();
    case TodoFilter.pending:
      return todos.where((todo) => !todo.done).toList();
  }
});