// login_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import '../../configs/service_locator.dart';
import '../../models/user_model.dart';
import '../../services/user/user_service.dart';

class LoginViewModel extends Viewmodel {
  final UserService _userService = locator();
  final List<User> _userList = [];
  List<User> get userList => _userList;
  int get count => _userList.length;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPwdController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();

  Future<bool> login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    bool isAuthenticated =
        await _userService.authenticateUser(username, password);

    if (isAuthenticated) {
      // Optionally, you can load user data here
      // loggedUser = await _userService.getUser(username);
      return true;
    } else {
      print("Incorrect username or password!");
      return false;
    }
  }

  Future<bool> register(BuildContext context) async {
    if (passwordController.text != confirmPwdController.text) {
      print("Passwords do not match!");
      return false;
    }

    User newUser = User(
      name: usernameController.text,
      password: passwordController.text,
      userId: idController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
      gender: genderController.text,
    );

    await _userService.addUser(newUser);
    update();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully registered!'),
      ),
    );
    return true;
  }

  Future<User> getUserData() async {
    String username = usernameController.text;
    return await _userService.getUser(username);
  }
}
