import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:sprint1/features/booking/booking_viewmodel.dart';

class ViewBooking extends StatelessWidget {
  const ViewBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<BookingViewModel>(
      builder: (context, viewmodel) => Scaffold(
        backgroundColor: const Color(0xFFb364f3),
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: const Text('My Booking'),
        ),
        body: ListView.builder(
          itemCount: viewmodel.count,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(viewmodel.bookList[index].id),
                subtitle: Text(viewmodel.bookList[index].selectedActivity),
                trailing: IconButton(
                  onPressed: () {
                    viewmodel.deleteBooking(viewmodel.bookList[index].id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
