import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/login/buttons_panel.dart';
import 'package:kiru/login/icons_panel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 12,
              children: [
                Image.asset(AppImages.appLogo, width: 68, height: 81),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 29),
                  child: Text(
                    'Kiru',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 57),
            ButtonsPanel(),
            const SizedBox(height: 61),
            IconsPanel(),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
