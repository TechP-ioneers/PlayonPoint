// setting.dart

import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:sprint1/features/setting/setting_viewmodel.dart';
import 'package:sprint1/models/user_model.dart';

class Setting extends StatelessWidget {
  final User passUser;
    final Function(User) updateUserCallback;

  const Setting({
    Key? key,
    required this.passUser, 
    required this.updateUserCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<SettingViewModel>(
      builder: (context, viewmodel) => Scaffold(
        backgroundColor: const Color(0xFFb364f3),
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: const Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  buildProfilePicture(),
                  const SizedBox(height: 10),
                  Text(
                    '${passUser.getName()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21.5,
                    ),
                  ),
                  Text(
                    '${passUser.getId()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Center(
                      child: Text(
                        'Active Student',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 400,
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'About',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildTextField(
                          Icons.email,
                          'Email',
                          viewmodel.emailController,
                          passUser.getEmail(),
                        ),
                        const SizedBox(height: 10),
                        buildTextField(
                          Icons.phone,
                          'Phone Number',
                          viewmodel.phoneController,
                          passUser.getPhone(),
                        ),
                        const SizedBox(height: 10),
                        buildTextField(
                          Icons.home,
                          'Address',
                          viewmodel.addressController,
                          passUser.getAddress(),
                        ),
                        const SizedBox(height: 10),
                        buildTextField(
                          Icons.person,
                          'Gender',
                          viewmodel.genderController,
                          passUser.getGender(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => viewmodel.saveChanges(context, updateUserCallback),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
              
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String label,
      TextEditingController value, String originalValue) {
    value.text = originalValue; // Set the original value to the controller

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            width: 250,
            child: TextField(
              controller: value,
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

  Widget buildProfilePicture() {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.amber,
    );
  }
}
