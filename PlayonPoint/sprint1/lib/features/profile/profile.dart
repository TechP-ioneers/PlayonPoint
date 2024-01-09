import 'package:flutter/material.dart';
import 'package:sprint1/features/profile/profile_viewmodel.dart';
import 'package:sprint1/features/setting/setting_viewmodel.dart';
import 'package:sprint1/models/user_model.dart';
import '../setting/setting.dart';

class Profile extends StatelessWidget {
  final ProfileViewModel profileViewModel;

  const Profile(
      {Key? key, required this.profileViewModel, required User passUser})
      : super(key: key);

  Widget buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb364f3),
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'User Profile',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final updatedUser = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(
                    passUser: profileViewModel.user, settingViewModel: SettingViewModel(passUser: profileViewModel.user),
                  ),
                ),
              );

              if (updatedUser != null) {
                profileViewModel.updateUser(updatedUser);
              }
            },
            icon: const Icon(Icons.settings),
          ),
        ],
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
                    '${profileViewModel.user.getName()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21.5),
                  ),
                  Text(
                    '${profileViewModel.user.getId()}',
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
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 300,
                    height: 300,
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
                        const SizedBox(height: 20),
                        buildInfoRow(
                            Icons.person, profileViewModel.user.getEmail()),
                        const SizedBox(height: 20),
                        buildInfoRow(
                            Icons.phone, profileViewModel.user.getPhone()),
                        const SizedBox(height: 20),
                        buildInfoRow(
                            Icons.home, profileViewModel.user.getAddress()),
                        const SizedBox(height: 20),
                        buildInfoRow(
                            Icons.work, profileViewModel.user.getGender()),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
