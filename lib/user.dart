
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
  });

  // Add this if you need to convert to/from JSON
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
    );
  }

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.name == name &&
      other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifier extends StateNotifier<User> {

  UserNotifier(super.state);

void UpdateName(String Name){
 state = state.copyWith(name: Name);
}

void Updateage(int age){
 state = state.copyWith(age: age);
}

}

class UserNotifierChange extends ChangeNotifier{

User user = User(name: '',age: 0);

void UpdateName(String Name){
  user= user.copyWith(name: Name);
  notifyListeners();
}

void Updateage(int age){
 user = user.copyWith(age: age);
 notifyListeners();
}


}
