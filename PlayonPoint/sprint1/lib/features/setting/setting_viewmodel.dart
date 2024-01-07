// setting_view_model.dart
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:sprint1/configs/service_locator.dart';
import 'package:sprint1/models/user.dart';
import 'package:sprint1/services/user/user_service.dart';

class SettingViewModel extends Viewmodel {
  late User _user;

  final UserService _userService = locator();

  void getUser() {
    _user = User();
    update();
  }

  Future<void> updateUser(User updatedUser) async {
    await _userService.updateUser(updatedUser.getId(), updatedUser);
    _user = updatedUser;
    _user.getEmail();
    _user.getPhone();
    _user.getAddress();
    _user.getGender();
    update();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String selectedGender = '';

  SettingViewModel({required User passUser}) {
    _user = passUser;
    emailController.text = _user.getEmail();
    phoneController.text = _user.getPhone();
    addressController.text = _user.getAddress();
    selectedGender = _user.getGender();
  }

  User get user => _user;

  void saveChanges(BuildContext context) {
    final updatedUser = User(
      name: _user.getName(),
      email: emailController.text,
      password: _user.getPassword(),
      phone: phoneController.text,
      address: addressController.text,
      gender: selectedGender,
      userId: _user.getId(),
    );

    Navigator.pop(context, updatedUser);
  }

  void updateSelectedGender(String value) {
    selectedGender = value;
    update();
  }
}
