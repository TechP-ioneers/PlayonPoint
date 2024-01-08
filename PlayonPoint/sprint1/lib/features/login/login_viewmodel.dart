// lib/Features/login/login_view_model.dart

import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:sprint1/configs/service_locator.dart';
import 'package:sprint1/services/user/user_service.dart';

class LoginViewModel extends Viewmodel {
  final UserService _userService = locator();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    String username = usernameController.text;
    String password = passwordController.text;


    bool isAuthenticated =
        await _userService.authenticateUser(username, password);

    if (isAuthenticated) {
      // ignore: use_build_context_synchronousl
    } else {}
    update();
  }
}
