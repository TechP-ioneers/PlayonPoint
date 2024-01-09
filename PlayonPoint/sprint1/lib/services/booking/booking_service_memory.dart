import 'package:sprint1/models/booking_model.dart';
import 'package:sprint1/services/booking/booking_service.dart';

class BookingServiceMemory extends BookingService {
  final List<Booking> book = [];
  @override
  Future<Booking> addBooking(Booking data) async {
    int index = book.length;
    book.insert(index, data);
    return (book[index]);
  }

  @override
  Future<Booking> deleteBooking(String id) async {
    final index = book.indexWhere((book) => book.getId() == id);
    book.removeAt(index);
    return (book[index]);
  }

  @override
  Future<List<Booking>> getAllBooking() async{
    return book;
  }

  @override
  Future<Booking> getBooking(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Booking> getBookingById(String bookingId) {
    throw UnimplementedError();
  }

  @override
  Future<Booking> updateBooking(String id, Booking data) {
    throw UnimplementedError();
  }
}
