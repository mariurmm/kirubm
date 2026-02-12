import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/login/icon_with_background.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F5),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(AppImages.settings, width: 24, height: 24),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Image.asset(AppImages.more, width: 24, height: 24),
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _ProfileCard(),
              const SizedBox(height: 20),
              _PostsSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 313,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 283,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 57, 16, 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'BloodStyle',
                          style: TextStyle(
                            fontSize: 17, //14
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.25,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(AppImages.verified, width: 12, height: 12),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _Stat(value: '3,8K', label: 'Подписчики'),
                        ),
                        Expanded(
                          child: _Stat(value: '5,4K', label: 'Лайки'),
                        ),
                        Expanded(
                          child: _Stat(value: '7', label: 'Публикации'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.grey,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Редактировать',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconWithBackground(
                          icon: AppImages.messages,
                          color: AppColors.grey,
                        ),
                        const SizedBox(width: 10),
                        IconWithBackground(
                          icon: AppImages.instagram,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Сотворю твой успех с помощью 100+ огненных образов. Моим капсулами пользуются более 2500 девушек — присоединяйся и ты!',
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.black87,
                        height: 1.35,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: CircleAvatar(
              radius: 42,
              child: ClipOval(
                child: Image.asset(
                  AppImages.profileAvatar,
                  width: 84,
                  height: 84,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      size: 54,
                      color: AppColors.white,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 19, //16
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12, //10
            fontWeight: FontWeight.w500,
            height: 1.0,
            letterSpacing: 0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _PostsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.grey,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(Icons.add_circle, color: AppColors.black, size: 18),
                const Text(
                  'Опубликовать',
                  textAlign:
                      TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.25, 
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _PostGrid(),
        ],
      ),
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
        mainAxisExtent: 213,
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
                height: 213,
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
