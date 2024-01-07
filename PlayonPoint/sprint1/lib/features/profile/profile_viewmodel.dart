import 'package:map_mvvm/view/viewmodel.dart';
import '../../services/user/user_service.dart';
import '../../models/user.dart';
import '../../configs/service_locator.dart';
// Assuming your Setting widget is in settingview.dart

class ProfileViewModel extends Viewmodel {
  late User _user;

  final UserService _userService = locator();

  // List<User> get users => _users;

  ProfileViewModel({required User passUser}) {
    _user = passUser;
  }

  User get user => _user;

//   Future<void> editUsers(User updatedUser) async {
//     User updated = await _userService.updateUser(updatedUser);
//     int index = _users.indexWhere((user) => user.getId() == updated.getId());
//     _users[index] = updated;
//     update();
//   }

  Future<void> getUser(String id) async {
    _user = await _userService.getUser();
    update();
  }
}
