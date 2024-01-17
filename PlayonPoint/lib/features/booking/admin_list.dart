import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'booking_viewmodel.dart';
import '../../models/user_model.dart';

class ViewBooking extends StatelessWidget {
  final User passUser;
  const ViewBooking({Key? key, required this.passUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<BookingViewModel>(
      builder: (context, viewmodel) {
        viewmodel.getAllBooking();

        return Scaffold(
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
                  title: Text("Booking ID: ${viewmodel.bookList[index].id}"),
                  titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selected Activity: ${viewmodel.bookList[index].selectedActivity}"),
                      Text("Players Quantity: ${viewmodel.bookList[index].playerQuantity.toString()}"),
                    ],
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          viewmodel.updateBooking(viewmodel.bookList[index].id, viewmodel.bookList[index]);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          viewmodel.deleteBooking(viewmodel.bookList[index].id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
