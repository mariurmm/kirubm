import 'package:flutter/material.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/widgets/svg_icon.dart';
import 'package:kiru/app_colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(icon: SvgIcon.search(), onPressed: () {}),
        title: const Text(
          'Избранное',
          style: TextStyle(
            fontSize: 19, //16
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
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
        mainAxisExtent: 240,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final imagePath = _mockImages[index % _mockImages.length];
        return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.fitWidth,
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
                    child: Icon(Icons.favorite, color: Colors.black, size: 10),
                  ),
                ),
              ],
            ),
          );
      },
    );
  }
}
