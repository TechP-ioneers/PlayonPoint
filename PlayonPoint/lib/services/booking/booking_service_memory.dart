import 'package:sprint1/models/booking_model.dart';
import 'package:sprint1/services/booking/booking_service.dart';

class BookingServiceMemory extends BookingService {
  final List<Booking> book = [
    Booking(
      id: '1',
      name: 'John',
      selectedActivity: 'Badminton',
      playerQuantity: 2,
      selectedTimeSlot: '9 AM - 10 AM',
    ),
    Booking(
      id: '2',
      name: 'Jane',
      selectedActivity: 'Ping Pong',
      playerQuantity: 4,
      selectedTimeSlot: '11 AM - 12 PM',
    ),
    Booking(
      id: '3',
      name: 'John',
      selectedActivity: 'Squash',
      playerQuantity: 3,
      selectedTimeSlot: '12 PM - 1 PM',
    ),
    Booking(
      id: '4',
      name: 'Jane',
      selectedActivity: 'Badminton',
      playerQuantity: 2,
      selectedTimeSlot: '4 PM - 5 PM'
      ),
    Booking(
      id: '5',
      name: 'Jack',
      selectedActivity: 'Ping Pong',
      playerQuantity: 4,
      selectedTimeSlot: '5 PM - 6 PM',
    ),
  ];

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
  Future<Booking> getBooking(String id) async{
  Booking result = book.firstWhere((book) => book.getId() == id,
        orElse: () => Booking(id: '', selectedActivity: '', playerQuantity: 0));
    return result;
  }

  @override
  Future<Booking> updateBooking(String id, Booking data) async{
   int index = book.indexWhere((book) => book.getId() == id);
    book[index] = data;
    return (book[index]);
  }
  
  @override
  Future<List<Booking>> getUserBooking(String name) async{
    return book.where((book) => book.name == name).toList();
  }
}
