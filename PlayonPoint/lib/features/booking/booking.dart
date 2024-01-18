import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:sprint1/models/user_model.dart';
import '../availability/availability.dart';
import 'booking_viewmodel.dart';

class BookingPage extends StatelessWidget {
  final User passUser;
  final String selectedTimeSlot;
  const BookingPage({Key? key, required this.passUser,required this.selectedTimeSlot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<BookingViewModel>(
      builder: (context, viewmodel) => Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          title: const Text('Sports Hall Booking'),
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Activity',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewmodel.setActivity('Ping Pong');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: viewmodel.selectedActivity == 'Ping Pong'
                        ? Colors.green
                        : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/pingpong.png', width: 30, height: 30),
                      const SizedBox(height: 8),
                      const Text('Ping Pong'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    viewmodel.setActivity('Badminton');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: viewmodel.selectedActivity == 'Badminton'
                        ? Colors.green
                        : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/badminton.png',
                          width: 30, height: 30),
                      const SizedBox(height: 8),
                      const Text('Badminton'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    viewmodel.setActivity('Squash');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: viewmodel.selectedActivity == 'Squash'
                        ? Colors.green
                        : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/squash.png', width: 30, height: 30),
                      const SizedBox(height: 8),
                      const Text('Squash'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Number of Players',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    viewmodel.decrementPlayerQuantity();
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  '${viewmodel.playerQuantity}',
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    viewmodel.incrementPlayerQuantity();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AvailabilityState(),
                  ),
                );
              },
              child: Text(
                  'Show Court Availability: ${selectedTimeSlot}'), // Update this line
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                viewmodel.setName(passUser.getName());
                viewmodel.showSubmissionSuccessMessage(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ViewBooking(passUser: passUser),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
