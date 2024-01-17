import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../booking/list.dart.dart';
import '../booking/booking.dart';
import 'home_viewmodel.dart';
import '../login/login.dart';
import '../profile/profile.dart';
import '../../models/user_model.dart';
import '../availability/availability.dart';
import '../qna/qna.dart';

class Home extends StatelessWidget {
  final User passUser;

  const Home({Key? key, required this.passUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<HomeViewModel>(builder: (context, viewmodel) => Scaffold(
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
                        passUser: passUser,
                      ),
                    ),
                  );
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
                          const LoginView(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('View Booking'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                           ViewBooking(passUser: passUser),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Qna'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QnaPage(),
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
                      builder: (context) =>
                          BookingPage(),
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
                  'Welcome, ${passUser.getName()}!',
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
      
                // Container for "Want to book?" and "Book Here"
                viewmodel.buildBookingContainer(context),
      
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
      ),
    );
  }
}
