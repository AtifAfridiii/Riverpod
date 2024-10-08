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

// void OnSubmitted(WidgetRef ref , String value){

// ref.read(nameProvider).UpdateName(value);

//   }

//   void OnSubmittedAge(WidgetRef ref , String value){

// ref.read(nameProvider).Updateage(int.parse(value));

//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // listening data from another provider in different file 
    // final user = ref.watch(nameProvider).user;

// return ref.watch(nameProvider).when(data: (data) {
//   return Scaffold(
//       appBar: AppBar(
  
//       ),
//       body: Column(
//         children: [
//       Center(child: Text(data.name,style: TextStyle(fontSize: 31 , fontWeight: FontWeight.bold),),)
//         ],
//       ),
//     );

// },
// error: (error, stackTrace) {
//   return Scaffold(
//       appBar: AppBar(
   
//       ),
//       body: Column(
//         children: [

//  Center(child: Text(error.toString()),)

        
//         ],
//       ),
//     );

// },
// loading: () {
//   return Scaffold(
//       appBar: AppBar(
    
//       ),
//       body: Column(
//         children: [


// Center(child: CircularProgressIndicator(color: Colors.black,),)
       
//         ],
//       ),
//     );

// },
// );
   return Scaffold(
    body: ref.watch(nameProvider).when(data: (data) {
      Center(child: Text(data.toString()),);
    }, error: (error, stackTrace) {
      Center(child: Text(error.toString()),) ;
    }, loading: () {
      Center(child: CircularProgressIndicator(color: Colors.black,),);
    },),
   );
      }
}
