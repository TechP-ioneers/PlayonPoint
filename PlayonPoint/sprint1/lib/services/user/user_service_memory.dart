import 'user_service.dart';
import '../../models/user_model.dart';

class UserServiceMemory extends UserService {
  final List<User> users = [
    User(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      phone: '123-456-7890',
      address: '123 Main St',
      userId: 'user123',
      gender: 'Male',
    ),
    User(
      name: 'Johna Dee',
      email: 'dee@example.com',
      password: 'password234',
      phone: '123-456-7890',
      address: '234 Main St',
      userId: 'user234',
      gender: 'Female',
    ),
  ];

  @override
  Future<User> getUser() async {
    return Future.value(users.isNotEmpty ? users[0] : User());
  }

  @override
  Future<List<User>> getAllUser() {
    return Future.value(users);
  }

  @override
  Future<User> updateUser(String id, User data) {
    final index = users.indexWhere((user) => user.getId() == id);
    users[index] = data;
    return Future.value(users[index]);
  }

  @override
  Future<User> addUser(User data) {
    int index = users.length;
    users.insert(index, data);
    return Future.value(users[index]);
  }

  @override
  Future<User> deleteUser(String id) {
    final index = users.indexWhere((user) => user.getId() == id);
    users.removeAt(index);
    return Future.value(users[index]);
  }
  
@override
Future<User> fetchUserData(String email, String password) {
  for (var user in users) {
    if (user.getEmail() == email && user.getPassword() == password) {
      return Future.value(user);
    }
  }
  return Future.value(User());
}

}
