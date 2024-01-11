import 'package:flutter/material.dart';
import 'package:sprint1/features/booking/booking.dart';
import 'package:map_mvvm/view/viewmodel.dart';

class AvailabilityViewModel extends Viewmodel{


  Widget buildPingPongContainer() {
    return Center(
      child: Container(
        width: 300,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ping Pong",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimeSlotsContainer(Function(String) onTapCallback) {
  return Container(
    width: 400,
    height: 400,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Time",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Rows of time slots from 8 AM to 9 PM with increased spacing
          for (int hour = 8; hour < 21; hour += 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTimeSlot(hour, hour + 1, onTapCallback),
                const SizedBox(width: 40), // Increase spacing between time slots
                buildTimeSlot(hour + 1, hour + 2, onTapCallback),
              ],
            ),
        ],
      ),
    ),
  );
}


  Widget buildTimeSlot(int startHour, int endHour, Function(String) onTapCallback) {
  // Convert 0 to 12 for display
  int displayStartHour = startHour % 12 == 0 ? 12 : startHour % 12;
  int displayEndHour = endHour % 12 == 0 ? 12 : endHour % 12;

  String timeSlot =
      '$displayStartHour ${startHour < 12 ? 'AM' : 'PM'} - $displayEndHour ${endHour < 12 ? 'AM' : 'PM'}';

  return GestureDetector(
    onTap: () {
      onTapCallback(timeSlot);
    },
    child: Container(
      width: 150,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.lightGreenAccent,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Center(
        child: Text(
          timeSlot,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

   void handleTimeSlotTap(String timeSlot, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingPage(),
      ),
    );
  }
}
