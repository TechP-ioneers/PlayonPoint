// lib/Features/login/login_view.dart

import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:sprint1/features/login/register.dart';
import '../home/home.dart';
import '../home/home_admin.dart';
import 'login_viewmodel.dart';
import '../../models/user_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<LoginViewModel>(builder: (context, viewmodel) => 
    Scaffold(
        appBar: AppBar(
          title: const Text('Register Page'),
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
                controller: viewmodel.usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: viewmodel.passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if(viewmodel.usernameController.text == 'admin' && viewmodel.passwordController.text == 'admin'){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeAdmin(),
                      ),
                    );
                  }else{
                  bool loginSuccess = await viewmodel.login();
      
                  if (loginSuccess) {
                    User loggedUser = await viewmodel.getUserData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(passUser: loggedUser),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Incorrect username or password. Please try again.'),
                      ),
                    );
                  }
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Don\'t have an account?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
