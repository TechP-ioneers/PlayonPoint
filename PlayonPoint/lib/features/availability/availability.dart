import 'package:flutter/material.dart';
import '../../../features/availability/availability_viewmodel.dart';

class AvailabilityState extends StatelessWidget {
  final AvailabilityViewModel viewModel = AvailabilityViewModel();

  AvailabilityState({super.key});

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
            'Welcome User!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          viewModel.buildPingPongContainer(),
          const SizedBox(height: 10),
          viewModel.buildTimeSlotsContainer((timeSlot) => viewModel.handleTimeSlotTap(timeSlot, context)),
        ],
      ),
    );
  }

 
}
