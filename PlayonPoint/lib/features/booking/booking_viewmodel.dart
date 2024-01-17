import '../../configs/service_locator.dart';
import '../../models/booking_model.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:flutter/material.dart';
import '../../services/booking/booking_service.dart';

class BookingViewModel extends Viewmodel {
  final Booking _model = Booking();
  final BookingService _bookingService = locator();
  List <Booking> _bookList = [];
  List <Booking> get bookList => _bookList;
  int get count => _bookList.length;

  String get selectedActivity => _model.selectedActivity;
  int get playerQuantity => _model.playerQuantity;

  Future<void> submitBooking(BuildContext context) async {
    final booking = Booking(
      selectedActivity: _model.selectedActivity,
      playerQuantity: _model.playerQuantity,
    );

    await _bookingService.addBooking(booking);
    showSubmissionSuccessMessage(context);
    update();
  }

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

  Future<void> getAllBooking() async {
  final list = await _bookingService.getAllBooking();
  _bookList = list;
    update();
  }

  Future<void> getUserBooking(String name) async {
  final list = await _bookingService.getUserBooking(name);
  _bookList = list;
    update();
  }



  Future<void> deleteBooking(String id) async {
    await _bookingService.deleteBooking(id);
    _bookList.removeWhere((element) => element.getId() == id);
    update();
  }

    Future<void> updateBooking(String id, Booking data) async {
    await _bookingService.updateBooking(id, data);
    int index = _bookList.indexWhere((element) => element.getId() == id);
    _bookList[index] = data;
    update();
  }

  @override
  void init() {
    getAllBooking();
    super.init();
  }

  // Future<void> getBooking(String id) async {
  //   await _bookingService.getBooking(id);
  //   update();
  // }
}
