import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/main.dart';



class Home extends ConsumerWidget {
  const Home({super.key});


// Example 3 of state_provider_notifier code is here 

// void OnSubmitted(WidgetRef ref , String value){

// ref.read(nameProvider.notifier).UpdateName(value);

//   }

//   void OnSubmittedAge(WidgetRef ref , String value){

// ref.read(nameProvider.notifier).Updateage(int.parse(value));

//   }


// Example 4 of Change_notifier_Provider code is here

void OnSubmitted(WidgetRef ref , String value){

ref.read(nameProvider).UpdateName(value);

  }

  void OnSubmittedAge(WidgetRef ref , String value){

ref.read(nameProvider).Updateage(int.parse(value));

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // listening data from another provider in different file 
    final user = ref.watch(nameProvider).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted:(value)=> OnSubmitted(ref,value),
          ),
          TextField(
            onSubmitted:(value)=> OnSubmittedAge(ref,value),
          ),
         Text(user.age.toString()),
        ],
      ),
    );
  }
}
