import 'package:sprint1/models/booking_model.dart';

abstract class BookingService {
  Future<List<Booking>> getAllBooking();
  Future<Booking> getBooking(String id);
  Future<Booking> addBooking(Booking data);
  Future<Booking> deleteBooking(String id);
  Future<Booking> updateBooking(String id, Booking data);
}
