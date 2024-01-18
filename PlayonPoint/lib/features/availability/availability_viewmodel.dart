import 'package:flutter/material.dart';
import 'package:sprint1/features/booking/booking.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import '../../models/booking_model.dart';
import '../../models/user_model.dart';

class AvailabilityViewModel extends Viewmodel {
  late User passUser;
  late String selectedTimeSlot;
  AvailabilityViewModel({required this.passUser});

  List<String> availableTimes = [
    '8 AM - 9 AM',
    '9 AM - 10 AM',
    '10 AM - 11 AM',
    '11 AM - 12 PM',
    '12 PM - 1 PM',
    '1 PM - 2 PM',
    '2 PM - 3 PM',
    '3 PM - 4 PM',
    '4 PM - 5 PM',
    '5 PM - 6 PM',
    '6 PM - 7 PM',
    '7 PM - 8 PM',
    '8 PM - 9 PM',
    '9 PM - 10 PM',
  ];



  Widget TitleContainer() {
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
                "Please select the time slot",
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
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 10,
              children: availableTimes.map((timeSlot) {
                return GestureDetector(
                  onTap: () {
                    onTapCallback(timeSlot);
                  },
                  child: _buildTimeSlotContainer(timeSlot),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlotContainer(String timeSlot) {
    return Container(
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
    );
  }

 void handleTimeSlotTap(String timeSlot, BuildContext context) {
    selectedTimeSlot = timeSlot; // Update the selectedTimeSlot
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingPage(
          passUser: passUser,
          selectedTimeSlot: selectedTimeSlot, // Pass selectedTimeSlot to BookingPage
        ),
      ),
    );
  }
}
