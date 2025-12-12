import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/favorites/favorites.dart';
import 'package:kiru/home/home_screen.dart';
import 'package:kiru/login/login_screen.dart';
import 'package:kiru/recommendations/recommendations.dart';
import 'package:kiru/profile/profile_screen.dart';
import 'package:kiru/widgets/svg_icon.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginScreen()),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,

          bottomNavigationBar: Container(
            width: double.infinity,
            height: 84,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  icon: SvgIcon.home(),
                ),
                IconButton(
                  onPressed: () {
                    context.go('/favorites');
                  },
                  icon: SvgIcon.favorites(),
                ),
                IconButton(
                  onPressed: () {
                    context.go('/recommendations');
                  },
                  icon: SvgIcon.recommendations(),
                ),
                IconButton(
                  onPressed: () {
                    context.go('/profile');
                  },
                  icon: SvgIcon.profile(),
                ),
              ],
            ),
          ),
        );
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesScreen(),
        ),
        GoRoute(
          path: '/recommendations',
          builder: (context, state) => const RecommendationsScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
