import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/widgets/svg_icon.dart';
import 'package:kiru/app_images.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: SvgIcon.search(), onPressed: () {}),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Вещи',
                style: TextStyle(
                  color: AppColors.buttonSecondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: VerticalDivider(
                color: AppColors.black,
                thickness: 1,
                width: 15,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Луки',
                style: TextStyle(
                  color: AppColors.buttonSecondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset(AppImages.add, width: 24, height: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          overscroll: false,
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [_ItemsSection(), const SizedBox(height: 24)],
          ),
        ),
      ),
    );
  }
}

class _ItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      child: Column(children: [const SizedBox(height: 16), _ItemGrid()]),
    );
  }
}

class _ItemGrid extends StatelessWidget {
  static const List<String> _mockImages = [AppImages.item1, AppImages.item2];
  
  static const List<Map<String, String>> _mockData = [
    //решила сделать разный текст, как мы делали разные картинки =)
    {
      'category': 'Кроссовки',
      'title': 'Yezzy 700 Wave Runner',
      'brand': 'Adidas',
    },
    {
      'category': 'Пуховик',
      'title': '1996 Retro Nuptse Jacket',
      'brand': 'The North Face',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        mainAxisExtent: 245,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final imagePath = _mockImages[index % _mockImages.length];
        final itemData = _mockData[index % _mockData.length];
        
        return LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = constraints.maxWidth;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: cardWidth,
                    height: cardWidth,
                    color: const Color(0xFFF5F6FA),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Image.asset(
                        imagePath,
                        width: cardWidth,
                        height: 170,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  itemData['category']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Color(0xCF373737),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  itemData['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  itemData['brand']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: Color(0xCF373737),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}