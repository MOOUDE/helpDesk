import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.firstName,
    this.lastName,
    this.available,
    this.phone,
    this.email,
    this.image,
  });

  final String? firstName;
  final String? lastName;
  final bool? available;
  final String? phone;
  final String? email;
  final String? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    available: json["available"] == null ? null : json["available"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "available": available == null ? null : available,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "image": image == null ? null : image,
  };
}