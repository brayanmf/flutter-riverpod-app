import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

final pokemonNameProvider = FutureProvider.autoDispose<String>((ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName=await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
});

//si quieres  limpiarlo autodispose tambien - 1 :]
final pokemonIdProvider = StateProvider<int>((ref) {
  return 1 ;
});

//family para enviar parametros, String valor de retorno, parametro
final pokemonProvider = FutureProvider.family.autoDispose<String,int>((ref,pokemonId) async {

  final pokemonName=await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
});