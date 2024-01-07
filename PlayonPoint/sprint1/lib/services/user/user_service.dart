import 'package:sprint1/models/user.dart';

abstract class UserService {
  Future<List<User>> getAllUser();
  Future<User> getUser();

  Future<void> updateUser(String id, User data);
}
