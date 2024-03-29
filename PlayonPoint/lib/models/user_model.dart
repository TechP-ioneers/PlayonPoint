class User {
  String name;
  String email;
  String password;
  String phone;
  String address;
  String gender;
  String userId;

  User({
    this.name = " ",
    this.email = " ",
    this.password = " ",
    this.phone = " ",
    this.address = " ",
    this.userId = " ",
    this.gender = " ",
  });

  // Getters
  String getName() => name;
  String getEmail() => email;
  String getPassword() => password;
  String getPhone() => phone;
  String getAddress() => address;
  String getGender() => gender;
  String getId() => userId;

  // Setters
  set setName(String name) => this.name = name;
  set setEmail(String email) => this.email = email;
  set setPassword(String password) => this.password = password;
  set setPhone(String phone) => this.phone = phone;
  set setAddress(String address) => this.address = address;
  set setGender(String gender) => this.gender = gender;
  set setId(String userId) => this.userId = userId;
}
