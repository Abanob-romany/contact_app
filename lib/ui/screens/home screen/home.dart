import 'dart:io';

import 'package:contact_app/ui/utils/app_assets.dart';
import 'package:contact_app/ui/utils/app_colors.dart';
import 'package:contact_app/ui/utils/app_style.dart';
import 'package:contact_app/ui/widgets/flouting_actions.dart';
import 'package:contact_app/ui/widgets/user_data.dart';
import 'package:contact_app/ui/widgets/user_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

List<UserData> userDataList = [];

class Home extends StatefulWidget {
  final Function(String, String, String, File?) onAddContact;
  const Home({super.key, required this.onAddContact});

  @override
  State<Home> createState() => _HomeState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController mobileController = TextEditingController();
File? selectedImage;

class _HomeState extends State<Home> {
  Future<File?> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
      return selectedImage;
    }
    return null;
  }

  void saveContact() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = mobileController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    setState(() {
      userDataList.add(
        UserData(
          name: name,
          email: email,
          phoneNumber: phone,
          image: selectedImage,
        ),
      );
      nameController.clear();
      emailController.clear();
      mobileController.clear();
      selectedImage = null;
    });
    Navigator.pop(context);
  }

  void deleteLastContact(List<UserData> contacts) {
    if (contacts.isNotEmpty) {
      contacts.removeLast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(AppAssets.appLogo),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child:
                  userDataList.isEmpty
                      ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.noContactShown),
                          Text(
                            'There is No Contacts Added Here',
                            style: AppStyle.bold20GoldStyle,
                          ),
                        ],
                      )
                      : GridView.builder(
                        padding: const EdgeInsets.all(6),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 160 / 286,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                        itemCount: userDataList.length,
                        itemBuilder: (context, index) {
                          final contact = userDataList[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.gold,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child:
                                          contact.image != null
                                              ? Image.file(
                                                contact.image!,
                                                height: 167,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              )
                                              : Container(
                                                height: 165,
                                                width: 160,
                                                color: Colors.grey,
                                                child: Icon(
                                                  Icons.person,
                                                  size: 80,
                                                ),
                                              ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: 10,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.gold,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          contact.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.email,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              contact.email,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black54,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            contact.phoneNumber,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          userDataList.removeAt(index);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Delete",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Align(
          alignment: Alignment.bottomRight,
          child: floutingButtonBiulder(
            heroTag: "add",
            image: Image.asset(AppAssets.addContact),
            color: AppColors.gold,
            onPressed:
                () => showUserProfileForm(
                  context,
                  imagePick: pickImage(),
                  saveContact: saveContact,
                ),
          ),
        ),
      ),
    );
  }
}
