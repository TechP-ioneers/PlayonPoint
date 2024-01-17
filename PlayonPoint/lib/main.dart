import 'package:flutter/material.dart';
import 'package:sprint1/features/login/login.dart';
import 'configs/service_locator.dart';

void main() {
  
  runApp( const MyApp());

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
      home: LoginView(),
    );
  }
}
