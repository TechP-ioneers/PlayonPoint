// lib/Features/login/login_view.dart

import 'package:flutter/material.dart';
import 'package:sprint1/features/home/home.dart';
import 'package:sprint1/features/home/home_viewmodel.dart';
import 'package:sprint1/features/login/login_viewmodel.dart';
import 'package:sprint1/models/user_model.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel viewModel;

  const LoginView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo_sporthall.png',
            ),
            TextField(
              controller: viewModel.usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: viewModel.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                bool loginSuccess = await viewModel.login();

                if (loginSuccess) {
                  User loggedUser = await viewModel.getUserData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(passUser: loggedUser, viewModel: HomeViewModel(passUser: loggedUser),),
                    ),
                  );
                } else {
                  // Show a Snackbar if login fails
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Incorrect username or password. Please try again.'),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
