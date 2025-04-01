import 'package:contact_app/ui/screens/home%20screen/home.dart';
import 'package:contact_app/ui/utils/app_assets.dart';
import 'package:contact_app/ui/utils/app_colors.dart';
import 'package:contact_app/ui/utils/app_style.dart';
import 'package:contact_app/ui/widgets/text_form_builder.dart';
import 'package:flutter/material.dart';

showUserProfileForm(BuildContext context, {required Future<void> imagePick, required Function saveContact}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: userProfileForm(imagePick, saveContact),
        ),
  );
}

userProfileForm(Future<void> pickImage, Function saveContact) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.darkBlue,
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectedImage != null
                ? Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.gold, width: 1),
                    image: DecorationImage(
                      image: FileImage(selectedImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                : ElevatedButton(
                  onPressed: () async {
                    await pickImage;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.gold, width: 1),
                    ),
                    child: Image(image: AssetImage(AppAssets.imageNotPreview)),
                  ),
                ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text('User Name', style: AppStyle.bold16GoldStyle),
                  Divider(color: AppColors.gold, thickness: 1, height: 20),
                  Text('example@email.com', style: AppStyle.bold16GoldStyle),
                  Divider(color: AppColors.gold, thickness: 1, height: 20),
                  Text('+200000000000', style: AppStyle.bold16GoldStyle),
                ],
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
        SizedBox(height: 16),
        textFormFieldBuilder(hintText: 'Enter user name', controller: nameController),
        SizedBox(height: 8),
        textFormFieldBuilder(hintText: 'Enter user email', controller: emailController),
        SizedBox(height: 8),
        textFormFieldBuilder(hintText: 'Enter user phone', controller: mobileController),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
            child: ElevatedButton(
            onPressed: () async {
              await saveContact();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Save user',
              style: AppStyle.bold20GoldStyle.copyWith(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
