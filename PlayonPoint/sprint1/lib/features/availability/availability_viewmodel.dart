import 'package:flutter/material.dart';

class AvailabilityViewModel {
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
            Text(
              "Time",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Rows of time slots from 8 AM to 9 PM with spacing
            for (int hour = 8; hour < 21; hour += 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTimeSlot(hour, hour + 1, onTapCallback),
                  const SizedBox(width: 20), // Add spacing between time slots
                  buildTimeSlot(hour + 1, hour + 2, onTapCallback),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget buildTimeSlot(int startHour, int endHour, Function(String) onTapCallback) {
    String timeSlot =
        '${startHour % 12} ${startHour < 12 ? 'AM' : 'PM'} - ${endHour % 12} ${endHour < 12 ? 'AM' : 'PM'}';

    return GestureDetector(
      onTap: () {
        onTapCallback(timeSlot);
      },
      child: Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Center(
          child: Text(
            timeSlot,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
