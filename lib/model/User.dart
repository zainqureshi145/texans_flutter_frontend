class User {
  String name;
  String email;
  String password;
  String phone;
  String address;

  User(this.name, this.email, this.password, this.phone, this.address);

  User.fromJson(Map json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        phone = json['phone'],
        address = json['address'];

  Map toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address
    };
  }
}
