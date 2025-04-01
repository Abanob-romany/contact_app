import 'dart:io';

import 'package:contact_app/ui/screens/home%20screen/home.dart';
import 'package:contact_app/ui/widgets/user_data.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static Route home = MaterialPageRoute(
  builder: (_) => Home(
    onAddContact: (String name, String email, String phone, File? image) {
      userDataList.add(UserData(
        name: name,
        email: email,
        phoneNumber: phone,
        image: selectedImage!,
      ));
    },
  ),
);

}
