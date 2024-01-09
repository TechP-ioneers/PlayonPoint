import 'package:flutter/material.dart';
import 'package:sprint1/features/booking/booking.dart';
import 'package:sprint1/features/login/login.dart';
import 'package:sprint1/features/login/login_viewmodel.dart';
import 'package:sprint1/features/profile/profile.dart';
import 'package:sprint1/features/profile/profile_viewmodel.dart';
import 'package:sprint1/models/user_model.dart';
import 'package:sprint1/services/user/user_service_memory.dart';
import '../../../features/booking/booking_viewmodel.dart';
import '../availability/availability.dart';

class Home extends StatefulWidget {
  final User passUser;

  const Home({Key? key, required this.passUser}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: const Color(0xFFb364f3),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFFb364f3).withOpacity(0.5),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        passUser: widget.passUser,
                        profileViewModel:
                            ProfileViewModel(passUser: widget.passUser),
                      ),
                    ));
              },
            ),
            ListTile(
              title: const Text('Availability'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AvailabilityState(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginView(viewModel: LoginViewModel(context: context)),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Booking'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                        builder: (context) => BookingPage(viewModel: BookingViewModel()),

                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFb364f3), Color(0xFFD6F454)],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Welcome, ${widget.passUser.getName()}!',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 400,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Today's News!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sports Hall Repair News Report',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            'We would like to inform you that the sports hall is currently undergoing essential repairs and maintenance. This initiative is part of our ongoing efforts to enhance the overall facility and ensure a safe and enjoyable environment for everyone.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Containers for Ping Pong, Badminton, and Squash
              SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Container for Ping Pong
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvailabilityState(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  'Ping Pong',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container for Badminton
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvailabilityState(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  'Badminton',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container for Squash
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  AvailabilityState(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  'Squash',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 600,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
