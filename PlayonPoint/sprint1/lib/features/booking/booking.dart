import 'package:flutter/material.dart';
import 'package:sprint1/features/availability/availability.dart';
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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  viewModel.setActivity('Ping Pong');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: viewModel.selectedActivity == 'Ping Pong'
                      ? Colors.green
                      : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/pingpong.png', width: 48, height: 48),
                    const SizedBox(height: 8),
                    const Text('Ping Pong'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.setActivity('Badminton');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: viewModel.selectedActivity == 'Badminton'
                      ? Colors.green
                      : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/badminton.png', width: 48, height: 48),
                    const SizedBox(height: 8),
                    const Text('Badminton'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.setActivity('Squash');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: viewModel.selectedActivity == 'Squash'
                      ? Colors.green
                      : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/squash.png', width: 48, height: 48),
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
                  viewModel.decrementPlayerQuantity();
                },
                icon: const Icon(Icons.remove),
              ),
              Text(
                '${viewModel.playerQuantity}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                onPressed: () {
                  viewModel.incrementPlayerQuantity();
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
                  builder: (context) => Availability(),
                ),
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
