import 'user_service.dart';
import '../../models/user_model.dart';

class UserServiceMemory extends UserService {
  final List<User> users = [
    User(
      name: 'John',
      email: 'john@example.com',
      password: '123',
      phone: '123-456-7890',
      address: '123 Main St',
      userId: 'user123',
      gender: 'Male',
    ),
    User(
      name: 'Johna Dee',
      email: 'dee@example.com',
      password: '234',
      phone: '123-456-7890',
      address: '234 Main St',
      userId: 'user234',
      gender: 'Female',
    ),
  ];

  @override
  Future<User> getUser(String username) async {
    return users.firstWhere((user) => user.name == username,
        orElse: () => User(name: '', password: ''));
  }

  @override
  Future<List<User>> getAllUser() async {
    return users;
  }

  @override
  Future<User> updateUser(String id, User data) async{
    final index = users.indexWhere((user) => user.getId() == id);
    users[index] = data;
    return (users[index]);
  }

  @override
  Future<User> addUser(User data) async {
    int index = users.length;
    users.insert(index, data);
    return (users[index]);
  }

  @override
  Future<User> deleteUser(String id) async {
    final index = users.indexWhere((user) => user.getId() == id);
    users.removeAt(index);
    return (users[index]);
  }

  @override
  Future<User> getUserData(String email, String password) async {
    for (var user in users) {
      if (user.getEmail() == email && user.getPassword() == password) {
        return (user);
      }
    }
    return Future.value(User());
  }

  @override
  Future<bool> authenticateUser(String username, String password) async {
    User user = await getUser(username);
    return user.name.isNotEmpty && user.password == password;
  }
}
