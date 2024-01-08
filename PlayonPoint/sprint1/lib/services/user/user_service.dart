import 'package:sprint1/models/user_model.dart';

abstract class UserService {
  Future<List<User>> getAllUser();
  Future<User> getUser(String username);
  Future<User> addUser(User data);
  Future<User> deleteUser(String id);
  Future<User> updateUser(String id, User data);
  Future<User> fetchUserData(String email, String password);
  Future<bool> authenticateUser(String username, String password);
}
