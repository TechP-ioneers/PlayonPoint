import 'package:flutter/material.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import '../../configs/service_locator.dart';
import '../../models/user_model.dart';
import '../../services/user/user_service.dart';
import '../availability/availability.dart';
import '../booking/booking.dart';

class HomeViewModel extends Viewmodel {
  late User _user;
  
  final UserService _userService = locator();

  HomeViewModel({required User passUser}) {
    _user = passUser;
  }

  User get user => _user;

  Future <void> buildContainer() async {
    await _userService.getAllUser();
    update();
  }


  Widget buildNewsContainer() {
    return Center(
      child: Container(
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
    );
  }

  GestureDetector buildSportContainer(BuildContext context, String sport) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AvailabilityState()),
        );
      },
      child: Container(
        width: 100,
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              sport,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  

Widget buildBookingPromptContainer() {
  return Center(
    child: Container(
      width: 400,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Center(
        child: Text(
          'Want to book?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

GestureDetector buildBookHereContainer(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigate to the booking page
       Navigator.push(
                  context,
                  MaterialPageRoute(
                        builder: (context) => BookingPage(passUser: _user,selectedTimeSlot: 'timeslot',),

                  ),
                );

    },
    child: Container(
      width: 400,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.blue, // Customize the color as needed
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Center(
        child: Text(
          'Book Here',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color
          ),
        ),
      ),
    ),
  );
}

 Widget buildBookingContainer(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 120,
        decoration: const BoxDecoration(
          color: Color(0xFF444444),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Want to book?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Navigate to the booking page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookingPage(passUser: _user, selectedTimeSlot: 'timeslot',),
                  ),
                );
              },
              child: Container(
                width: 200,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFD6F454), // Customize the color as needed
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text(
                    'Book Here',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircularButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 80,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFb364f3), Color(0xFFD6F454)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: MaterialButton(
              onPressed: onPressed,
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
              child: Icon(icon, size: 30, color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
        ],
      ),
    );
  }

}
