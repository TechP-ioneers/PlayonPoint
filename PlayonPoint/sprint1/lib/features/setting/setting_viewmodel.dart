// setting_view_model.dart
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:sprint1/configs/service_locator.dart';
import 'package:sprint1/models/user_model.dart';
import 'package:sprint1/services/user/user_service.dart';

class SettingViewModel extends Viewmodel {
  late User _user;
  final UserService _userService = locator();
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
    updateUser(updatedUser);
    Navigator.pop(context, updatedUser);
  }

  Future<void> updateUser(User updatedUser) async {
    await _userService.updateUser(updatedUser.getId(), updatedUser);
    _user = updatedUser;
    update();
  }

  void updateSelectedGender(String value) {
    selectedGender = value;
    update();
  }

  Widget buildGenderDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            width: 250,
            child: DropdownButtonFormField<String>(
              value: selectedGender,
              onChanged: (String? value) {
                selectedGender = value!;
                update();
              },
              items: ['Female', 'Male']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
        ),
      ],
    );
  }

   Widget buildTextField(
      IconData icon, String label, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            width: 250,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
                prefixIcon: Icon(icon),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
