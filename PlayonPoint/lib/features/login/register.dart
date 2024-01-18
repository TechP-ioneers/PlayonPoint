import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:sprint1/features/login/login.dart';
import 'login_viewmodel.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<LoginViewModel>(
      builder: (context, viewmodel) => Scaffold(
        backgroundColor: Color(0xFFb364f3),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: viewmodel.usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextFormField(
                  controller: viewmodel.idController,
                  decoration: const InputDecoration(labelText: 'ID'),
                ),
                TextFormField(
                  controller: viewmodel.emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: viewmodel.passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                TextFormField(
                  controller: viewmodel.confirmPwdController,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
                TextFormField(
                  controller: viewmodel.phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                TextFormField(
                  controller: viewmodel.addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  controller: viewmodel.genderController,
                  decoration: const InputDecoration(labelText: 'Gender'),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                 ElevatedButton(
                  onPressed: () async {
                    bool registrationSuccess = await viewmodel.register(context);
          
                    if (registrationSuccess) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}