import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

const _uuui=Uuid();

final todoListProvider = StateNotifierProvider<Notifier, List<Todo>>((ref) => Notifier());

class Notifier extends StateNotifier<List<Todo>> {
  Notifier(): super([
    Todo(
      id: _uuui.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: DateTime.now(),
    ),
    Todo(
      id: _uuui.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null,
    ),
    Todo(
      id: _uuui.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null,
    ),
  ]);

  void addTodo() {
    state = [
      ...state,
      Todo(
        id: _uuui.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
    ];
  }
  void toggleTodo(String id){
     state=state.map((e){
      if (e.id !=id ) return e;
      if (e.done) return e.copyWith(completedAt: null);
      return e.copyWith(completedAt: DateTime.now());
      //una copia de mi clase con la propiedad cambiada copyWith
     }).toList();
  }

  
}