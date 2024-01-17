import '../../configs/service_locator.dart';
import '../../models/booking_model.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:flutter/material.dart';
import '../../services/booking/booking_service.dart';

class BookingViewModel extends Viewmodel {
  final Booking _model = Booking();
  final BookingService _bookingService = locator();
  List<Booking> _bookList = [];
  List<Booking> get bookList => _bookList;
  int get count => _bookList.length;

  String get selectedActivity => _model.selectedActivity;
  int get playerQuantity => _model.playerQuantity;
  String get selectedTimeSlot => _model.selectedTimeSlot;

  Future<void> submitBooking(BuildContext context) async {
    int result = _bookList.length + 1;
    _model.id = result.toString();
    final booking = Booking(
      id: _model.id,
      selectedActivity: _model.selectedActivity,
      playerQuantity: _model.playerQuantity,
      name: _model.name,
    );

    await addBooking(booking);
    showSubmissionSuccessMessage(context);
    update();
  }

  Future<void> setName(String name) async {
   name = _model.name;
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

  Future<void> addBooking(Booking data) async {
    final name = _model.name;
    setName(name);
    final booking = await _bookingService.addBooking(data);
    _bookList.add(booking);
    update();
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
