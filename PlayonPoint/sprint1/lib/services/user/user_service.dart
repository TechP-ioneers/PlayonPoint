import 'package:sprint1/models/user.dart';

abstract class UserService {
  Future<List<User>> getAllUser();
  Future<User> getUser();
  Future<User> addUser(User data);
  Future<User> deleteUser(String id);
  Future<User> updateUser(String id, User data);
}
