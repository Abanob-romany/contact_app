import 'dart:io';

class UserData {
  final String name;
  final String email;
  final String phoneNumber;
  final File? image;

  UserData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.image,
  });
}
