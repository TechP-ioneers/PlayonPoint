class Booking {
  String id;
  String name;
  String selectedActivity = 'Ping Pong';
  int playerQuantity;
  String selectedTimeSlot = '8 AM - 9 AM';

  Booking({
    this.id = '',
    this.name = '',
    this.selectedActivity = '',
    this.playerQuantity = 1,
  });

  String getId() => id;
}

