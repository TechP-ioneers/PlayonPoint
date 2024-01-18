import 'package:flutter/material.dart';
import 'package:sprint1/models/user_model.dart';
import '../../../features/availability/availability_viewmodel.dart';


class AvailabilityState extends StatelessWidget {
  final AvailabilityViewModel viewModel = AvailabilityViewModel(passUser: User());


  AvailabilityState({Key? key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text('Availability'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Court Availability',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          viewModel.TitleContainer(),
          const SizedBox(height: 10),
         viewModel.buildTimeSlotsContainer((timeSlot) =>
    viewModel.handleTimeSlotTap(timeSlot, context)),

        ],
      ),
    );
  }
 
}


