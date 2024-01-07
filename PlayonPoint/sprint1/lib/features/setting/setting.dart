// setting.dart
import 'package:flutter/material.dart';
import 'package:sprint1/models/user.dart';

class Setting extends StatefulWidget {
  final User passUser;

  const Setting({Key? key, required this.passUser}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late User user;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String selectedGender = '';

  @override
  void initState() {
    super.initState();
    user = widget.passUser;
    emailController.text = user.getEmail();
    phoneController.text = user.getPhone();
    addressController.text = user.getAddress();
    selectedGender = user.getGender();
  }

  void saveChanges() {
    final updatedUser = User(
      name: user.getName(),
      email: emailController.text,
      password: user.getPassword(),
      phone: phoneController.text,
      address: addressController.text,
      gender: selectedGender,
      userId: user.getId(),
    );

    Navigator.pop(context, updatedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb364f3),
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text('Settings'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
        ),
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
                    '${user.getName()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21.5),
                  ),
                  Text(
                    '${user.getId()}',
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
                        buildTextField(
                            Icons.email, 'Email', emailController),
                        const SizedBox(height: 10),
                        buildTextField(
                            Icons.phone, 'Phone Number', phoneController),
                        const SizedBox(height: 10),
                        buildTextField(Icons.home, 'Address', addressController),
                        const SizedBox(height: 10),
                        buildGenderDropdown(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: saveChanges,
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
                setState(() {
                  selectedGender = value!;
                });
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
}