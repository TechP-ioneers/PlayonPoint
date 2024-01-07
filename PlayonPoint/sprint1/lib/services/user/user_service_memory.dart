import 'user_service.dart';
import '../../models/user.dart';
import 'package:flutter/material.dart';


class UserServiceMemory extends UserService {
  @override
  final List<User> users = [
    User(
      name: 'John Doe', // Replace with actual user data
      email: 'john@example.com',
      password: 'password123',
      phone: '123-456-7890',
      address: '123 Main St',
      userId: 'user123',
      gender: 'Male',
    ),

      User(
      name: 'Johna Dee', // Replace with actual user data
      email: 'dee@example.com',
      password: 'password234',
      phone: '123-456-7890',
      address: '234 Main St',
      userId: 'user234',
      gender: 'Female',
    ),
  ];

  @override
  Future<List<User>> getUser() async {
    return users;
  }

  @override
  Future<User> updateUsers(String id, User updatedUser) async {
    final index = users.indexWhere((user) => user.getId() == id);
    users[index] = updatedUser;
    return users[index];
    
  }
}
