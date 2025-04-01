import 'package:contact_app/ui/utils/app_colors.dart';
import 'package:contact_app/ui/utils/app_style.dart';
import 'package:flutter/material.dart';

textFormFieldBuilder({required String hintText, required TextEditingController controller}) => TextFormField(
  controller: controller,
  decoration: InputDecoration(
    fillColor: AppColors.darkBlue,
    filled: true,
    hintText: hintText,
    hintStyle: AppStyle.bold16LightBlueStyle.copyWith(
      fontWeight: FontWeight.w400,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold, width: 0.5),
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold, width: 0.5),
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold, width: 0.5),
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  style: AppStyle.bold16LightBlueStyle.copyWith(fontWeight: FontWeight.w400),
);
