import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    // Perform login logic, you can add validation or authentication here
    print('Username: $username\nPassword: $password');
}
}