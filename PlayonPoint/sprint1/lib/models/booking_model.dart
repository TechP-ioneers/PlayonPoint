class Booking {
  String id;
  String selectedActivity = 'Ping Pong';
  int playerQuantity;

  Booking({
    this.id = '',
    this.selectedActivity = "",
    this.playerQuantity = 1,
  });

  String getId() => id;
}

