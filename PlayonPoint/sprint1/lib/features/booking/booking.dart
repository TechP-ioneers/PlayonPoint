//booking.dart

import 'package:flutter/material.dart';
import 'package:sprint1/features/booking/booking_viewmodel.dart';

class BookingPage extends StatelessWidget {
  final BookingViewModel viewModel;

  const BookingPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: const Text('Sports Hall Booking'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Select Activity',
            style: TextStyle(fontSize: 20),
          ),
          // ... (rest of your code remains the same)
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Court Availability'),
                    content: const Column(
                      // Add your content here
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Show Court Availability'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showSubmissionSuccessMessage(context);
            },
            style: ElevatedButton.styleFrom(
              // backgroundColor: Colors.white,
            ),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showSubmissionSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Submission Successful!'),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
