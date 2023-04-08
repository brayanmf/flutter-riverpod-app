import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../config/helpers/random_generator.dart';

final counterProvider = StateProvider<int>((ref) {
  return 6;
});
final isDarModeProvider = StateProvider<bool>((ref) {
  return false;
});

final randomNameProvider = StateProvider<String>((ref) {
  return RandomGenerator.getRandomName();
});


