import 'package:flutter/material.dart';
import 'package:sprint1/models/user.dart';
import 'home/home.dart';
import '../services/user/user_service.dart';
import '../services/user/user_service_memory.dart'; 
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
      home: Home(passUser: User()),
    );
  }
}
