import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';


class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body:  Center(
       child:pokemonAsync.when(
          data: (pokemon) => Text(pokemon),
          error: (error, stack) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
       
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.refresh ),
        onPressed: () { 
          ref.read(pokemonIdProvider.notifier).update((state) => 
            state+1  );
         },
      ),
    );
  }
}