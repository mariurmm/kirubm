import 'package:flutter/material.dart';
import 'package:kiru/home/home_screen.dart';

void main() {
  runApp(const KiruApp());
}

class KiruApp extends StatelessWidget {
  const KiruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
