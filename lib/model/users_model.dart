class usersModel {
  final username;
  final email;
  final age;
  final password;
  final id;

  usersModel({
    this.username,
    this.email,
    this.age,
    this.password,
    this.id,
  });

  factory usersModel.fromJson(Map<String, dynamic> json) {
    return usersModel(
        username: json['username'],
        email: json['email'],
        age: json['age'],
        password: json['password'],
        id: json['id']);
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "username": username,
      "email": email,
      "age": age,
      "password": password,
    };
  }
}
