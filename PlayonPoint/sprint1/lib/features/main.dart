import 'package:flutter/material.dart';
import 'package:sprint1/features/login/login.dart';
import 'package:sprint1/features/login/login_viewmodel.dart';
import '../configs/service_locator.dart';

void main() {
  
  runApp( MyApp());

  initilizeServiceLocator();
}

class MyApp extends StatelessWidget {

  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlayonPoint Booking System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginView(viewModel: LoginViewModel()),
    );
  }
}
