// LoginViewModel

import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:sprint1/configs/service_locator.dart';
import 'package:sprint1/features/home/home.dart';
import 'package:sprint1/models/user_model.dart';
import 'package:sprint1/services/user/user_service.dart';

class LoginViewModel extends Viewmodel {
  late User _user;
  final UserService _userService = locator();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  LoginViewModel({required User passUser}) {
    _user = passUser;
  }

  User get user => _user;

  Future<void> login() async {
    final email = usernameController.text;
    final password = passwordController.text;

    try {
      final fetchedUser = await _userService.fetchUserData(email, password);
      if (fetchedUser.getId().isNotEmpty) {
        _user = fetchedUser;
    
        print('Login successful! User: ${_user.getName()}');
        update();
      } else {
        print('Login f ailed. User not found.');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
