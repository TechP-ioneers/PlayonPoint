class User {
  String name;
  String email;
  String password;
  String phone;
  String address;
  String gender;
  String userId;
  Boolean bookingNotification;
  late String profilePictureUrl;

  User({
    this.name = " ",
    this.email = " ",
    this.password = " ",
    this.phone = " ",
    this.address = " ",
    this.userId = " ",
    this.gender = " ",
    this.profilePictureUrl = " ",
    this.bookingNotification = false,
  });

  // Getters
  String getName() => name;
  String getEmail() => email;
  String getPassword() => password;
  String getPhone() => phone;
  String getAddress() => address;
  String getGender() => gender;
  String getId() => userId;
  String getProfilePictureUrl() => profilePictureUrl;

  // Setters
  set setName(String name) => this.name = name;
  set setEmail(String email) => this.email = email;
  set setPassword(String password) => this.password = password;
  set setPhone(String phone) => this.phone = phone;
  set setAddress(String address) => this.address = address;
  set setGender(String gender) => this.gender = gender;
  set setId(String userId) => this.userId = userId;

  // CopyWith method
  User copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? address,
    String? gender,
    String? userId,
    String? profilePictureUrl,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      userId: userId ?? this.userId,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
      gender: json['gender'],
      userId: json['userId'],
      profilePictureUrl: json['profilePictureUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'gender': gender,
      'userId': userId,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
