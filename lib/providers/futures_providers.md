## asincronismo

lo curioso es que los providers estan conectados
```
final pokemonNameProvider = FutureProvider.autoDispose<String>((ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName=await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
});


final pokemonIdProvider = StateProvider<int>((ref) {
  return 1 ;
});

```
