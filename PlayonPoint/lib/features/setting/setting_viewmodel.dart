// setting_view_model.dart
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import '../../configs/service_locator.dart';
import '../../models/user_model.dart';
import '../../services/user/user_service.dart';

class SettingViewModel extends Viewmodel {
  late User _user;
  final UserService _userService = locator();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  SettingViewModel({required User passUser}) {
    _user = passUser;
    emailController.text = _user.getEmail();
    phoneController.text = _user.getPhone();
    addressController.text = _user.getAddress();
    genderController.text = _user.getGender();
  }

  User get user => _user;

  void saveChanges(BuildContext context, Function(User) updateUserCallback) {
    final updatedUser = User(
      name: _user.getName(),
      email: emailController.text,
      password: _user.getPassword(),
      phone: phoneController.text,
      address: addressController.text,
      gender: genderController.text,
      userId: _user.getId(),
    );

    updateUser(updatedUser);
    update();
    updateUserCallback(updatedUser);
    Navigator.pop(context, updatedUser);
  }

  Future<void> updateUser(User updatedUser) async {
    await _userService.updateUser(updatedUser.getId(), updatedUser);
    _user = updatedUser;
    update();
  }
}
