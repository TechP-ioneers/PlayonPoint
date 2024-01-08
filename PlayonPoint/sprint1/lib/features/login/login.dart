import 'package:flutter/material.dart';
import 'package:sprint1/models/user_model.dart';
import 'login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginViewModel _viewModel = LoginViewModel(passUser: User());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Network image example
            Image.asset(
              'lib/icon/logo sporthall.png',
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _viewModel.usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _viewModel.passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _viewModel.login();
                if (_viewModel.user.getId().isNotEmpty) {
                 
                  print('Login successful! User: ${_viewModel.user.getName()}');
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  print('Login failed. User not found.');
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return const Color.fromARGB(255, 1, 76, 137);
                  },
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Navigate to the registration page
                Navigator.pushNamed(context, '/registration');
              },
              child: const Text(
                "Don't have an account? Register now",
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 55, 98),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
