import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
//provider de solo lectura

final simpleNameProvider = Provider<String>((ref) {
  return RandomGenerator.getRandomName();
});