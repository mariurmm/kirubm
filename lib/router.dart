import 'package:go_router/go_router.dart';
import 'package:kiru/favorites/favorites.dart';
import 'package:kiru/home/home_screen.dart';
import 'package:kiru/login/login_screen.dart';
import 'package:kiru/recomendations/recomendations.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),

    GoRoute(path: '/favorites', builder: (context, state) => FavoritesScreen()),
    GoRoute(
      path: '/recommendations',
      builder: (context, state) => RecommendationsScreen(),
    ),
  ],
);
