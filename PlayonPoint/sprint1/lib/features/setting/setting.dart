// setting.dart
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'setting_viewmodel.dart';
import '../../models/user_model.dart';

class Setting extends StatelessWidget {
  final User passUser;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String selectedGender = '';

  Setting({Key? key, required this.passUser})
      : super(key: key) {
    emailController.text = passUser.getEmail();
    phoneController.text = passUser.getPhone();
    addressController.text = passUser.getAddress();
    selectedGender = passUser.getGender();
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<SettingViewModel>(builder: (context, viewmodel) => Scaffold(
        backgroundColor: const Color(0xFFb364f3),
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
        ),
        
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.amber,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${passUser.getName()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21.5),
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
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          viewmodel.buildTextField(Icons.email, 'Email', emailController),
                          const SizedBox(height: 10),
                          viewmodel.buildTextField(
                              Icons.phone, 'Phone Number', phoneController),
                          const SizedBox(height: 10),
                          viewmodel.buildTextField(Icons.home, 'Address', addressController),
                          const SizedBox(height: 10),
                          viewmodel.buildGenderDropdown(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => viewmodel.saveChanges(context),
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
