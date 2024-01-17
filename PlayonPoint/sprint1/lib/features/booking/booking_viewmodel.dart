import 'package:flutter/material.dart';

<<<<<<< Updated upstream
class BookingViewModel {
  Widget buildBody() {
    return const Center(
      child: Text('Hello World'),
    );
  }
=======
class BookingViewModel extends Viewmodel {
  final Booking _model = Booking(userId: '');
  final BookingService _bookingService = locator();
  List <Booking> _bookList = [];
  List <Booking> get bookList => _bookList;
  int get count => _bookList.length;

  String get selectedActivity => _model.selectedActivity;
  int get playerQuantity => _model.playerQuantity;

  Future<void> submitBooking(BuildContext context, String userId) async {
    final booking = Booking(
      selectedActivity: _model.selectedActivity,
      playerQuantity: _model.playerQuantity,
      userId: userId,
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

  Future<void> getAllBooking(String userId) async {
  final list = await _bookingService.getAllBooking();
  _bookList = list.where((booking) => booking.userId == userId).toList();
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
    getAllBooking(_model.userId);
    super.init();
  }

  // Future<void> getBooking(String id) async {
  //   await _bookingService.getBooking(id);
  //   update();
  // }
>>>>>>> Stashed changes
}
