import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const GardenApp());
}

class GardenApp extends StatelessWidget {
  const GardenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}