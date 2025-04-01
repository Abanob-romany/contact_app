import 'package:contact_app/ui/utils/app_assets.dart';
import 'package:contact_app/ui/utils/app_colors.dart';
import 'package:contact_app/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, AppRoutes.home);
    });
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(child: Image.asset(AppAssets.splashLogo)),
    );
  }
}
