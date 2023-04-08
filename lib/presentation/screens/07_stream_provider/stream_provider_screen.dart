import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';


class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: StreamView(),
     
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userInChat=ref.watch(usersInChatProvider);
    //userInChat.when()===
    if(!userInChat.hasValue){
      return const CircularProgressIndicator();
    }
        return ListView.builder(
          itemCount: userInChat.value!.length,
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              title: Text(userInChat.value![index]),
            );
          },
        );
  }
}