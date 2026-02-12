import 'package:flutter/material.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/widgets/svg_icon.dart';
import 'package:kiru/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(icon: SvgIcon.search(), onPressed: () {}),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Подписки',
                style: TextStyle(
                  color: AppColors.buttonSecondaryText,
                  fontSize: 14, //12
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.black),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: Text(
                'Рекомендации',
                style: TextStyle(
                  color: AppColors.buttonPrimaryText,
                  fontSize: 14, //12
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          overscroll: false,
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [_PostsSection(), const SizedBox(height: 24)],
          ),
        ),
      ),
    );
  }
}

class _PostsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      child: Column(children: [const SizedBox(height: 16), _PostGrid()]),
    );
  }
}

class _PostGrid extends StatelessWidget {
  static const List<String> _mockImages = [AppImages.post1, AppImages.post2];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        mainAxisExtent: 332,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        final imagePath = _mockImages[index % _mockImages.length];
        return LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = constraints.maxWidth;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.asset(
                        imagePath,
                        width: cardWidth,
                        height: 290,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.black,
                            size: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppImages.profileAvatar,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Звезда Токио',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17, //14
                                  height: 1.0,
                                  letterSpacing: 0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'от',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17, //14
                                  height: 1.0,
                                  letterSpacing: 0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),

                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Text(
                                'HummusChan19',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14, //12
                                  height: 1.0,
                                  letterSpacing: 0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                AppImages.verified,
                                width: 10,
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
