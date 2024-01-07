import 'package:flutter/material.dart';
import 'login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginViewModel _viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Network image example
            Container(
              child: Image.asset(
                'lib/icon/logo sporthall.png',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _viewModel.usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _viewModel.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _viewModel.login,
              child: Text('Login'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Color.fromARGB(255, 1, 76, 137);
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _openRegistrationPage,
              child: Text(
                "Don't have an account? Register now",
                style: TextStyle(
                  color: const Color.fromARGB(255, 2, 55, 98),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openRegistrationPage() {
    print('Navigate to the registration page');
    // You can add navigation logic here
  }
}