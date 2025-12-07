import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/login/icon_with_background.dart';

class IconsPanel extends StatelessWidget {
  const IconsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 23,
      children: [
        Text(
          'Войти с помощью',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            IconWithBackground(icon: AppImages.google),
            IconWithBackground(icon: AppImages.facebook),
            IconWithBackground(icon: AppImages.vk),

          ],
        ),
      ],
    );
  }
}

// class IconsPanel extends StatelessWidget {
//   const IconsPanel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 23,
//       children: [
//         Text(
//           'Войти с помощью',
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w500,
//             color: AppColors.black,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           spacing: 10,
//           children: [
//             IconWithBackground(icon: AppImages.google),
//             IconWithBackground(icon: AppImages.facebook),
//             IconWithBackground(icon: AppImages.vk),
//           ],
//         ),
//       ],
//     );
//   }
// }
