import 'package:sprint1/configs/service_locator.dart';
import 'package:sprint1/models/booking_model.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:sprint1/services/booking/booking_service.dart';

class BookingViewModel extends Viewmodel {
  final Booking _model = Booking();
    final BookingService _bookingService = locator();

  String get selectedActivity => _model.selectedActivity;
  int get playerQuantity => _model.playerQuantity;

  void setActivity(String activity) {
    _model.selectedActivity = activity;
    update();
  }

  void decrementPlayerQuantity() {
    if (_model.playerQuantity > 1) {
      _model.playerQuantity--;
      update();
    }
  }

  void incrementPlayerQuantity() {
    if (_model.playerQuantity < 6) {
      _model.playerQuantity++;
      update();
    }
  }

  void showSubmissionSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Submission Successful!'),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
