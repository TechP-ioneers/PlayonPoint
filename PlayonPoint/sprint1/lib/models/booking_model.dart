<<<<<<< Updated upstream
=======
class Booking {
  String id;
  String userId;
  String selectedActivity = 'Ping Pong';
  int playerQuantity;
  String selectedTimeSlot = '8 AM - 9 AM';

  Booking({
    this.id = '',
    required this.userId,
    this.selectedActivity = "",
    this.playerQuantity = 1,
  });

  String getId() => id;
}

>>>>>>> Stashed changes
