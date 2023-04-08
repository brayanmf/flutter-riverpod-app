import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';
/*

class ProviderScreen extends ConsumerWidget {//StatelessWidget
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref ) {

    final name=ref.watch(simpleNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body:  Center(
        child: Text("$name --"),
      ),
    );
  }
}
*/
class ProviderScreen extends ConsumerStatefulWidget {// stateful
  const ProviderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends ConsumerState<ProviderScreen> {

  @override
  Widget build(BuildContext context) {
        final name=ref.watch(simpleNameProvider);
    
   return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body:  Center(
        child: Text("$name --"),
      ),
    );
  }
}