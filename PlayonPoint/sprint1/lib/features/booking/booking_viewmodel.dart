import 'package:sprint1/models/booking_model.dart';
import 'package:map_mvvm/view/viewmodel.dart';

class BookingViewModel extends Viewmodel{
  final Booking _model = Booking();

  String get selectedActivity => _model.selectedActivity;
  int get playerQuantity => _model.playerQuantity;

  void setActivity(String activity){
    _model.selectedActivity = activity;
    update();
  }

  void decrementPlayerQuantity(){
    if(_model.playerQuantity > 1){
      _model.playerQuantity--;
      update();
    }
  }

  void incrementPlayerQuantity(){
    if(_model.playerQuantity < 6){
      _model.playerQuantity++;
      update();
    }
  }
}