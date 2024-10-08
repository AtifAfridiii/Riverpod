import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/home.dart';
import 'package:state/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// declaring global data here :

// we have 6 types of provider in fluter_riverpod package so , i will do all of them in this project 

// 1) provider

// final nameProvider = Provider<String>((ref){
// return 'Atif';
// });



// 2) stateProvider
// final nameProvider = StateProvider<String?>((ref){
// return null;
//});

// 3) Statenotifer and statenotifierProvider

// final nameProvider = StateNotifierProvider<UserNotifier , User>((ref) => UserNotifier(User(name: '', age: 10)),);

// 4) Change notifier provider => usually its not recommended its better to user state_notifier_ provider because its muatable

 //final nameProvider = ChangeNotifierProvider((ref) => UserNotifierChange());

// 5) Future_provider  

final nameProvider = FutureProvider((ref) async {
  const url = 'https://jsonplaceholder.typicode.com/users/1';
  
  // Fetch the data
  final response = await http.get(Uri.parse(url));
  
  // Decode the JSON and map it to the User object
  final data = json.decode(response.body); // Use json.decode here
  return User.fromMap(data);
});


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

