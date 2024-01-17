import 'package:map_mvvm/view/viewmodel.dart';
import '../../services/user/user_service.dart';
import '../../models/user_model.dart';
import '../../configs/service_locator.dart';

class ProfileViewModel extends Viewmodel {
  late User _user;

  final UserService _userService = locator();

  ProfileViewModel({required User passUser}) {
    _user = passUser;
  }

  User get user => _user;

  Future<void> updateUser(User updatedUser) async {
    await _userService.updateUser(_user.getId(), updatedUser);
    _user = updatedUser;
    update();
  }
}
