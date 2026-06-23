import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // 1. Add this import

import 'home.dart';

// 2. Change main() to be async
Future<void> main() async {
  // 3. Ensure Flutter is fully initialized before loading the file
  WidgetsFlutterBinding.ensureInitialized();

  // 4. Load the .env file into global memory
  await dotenv.load(fileName: ".env");

  runApp(const GardenApp());
}

class GardenApp extends StatelessWidget {
  const GardenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Your routing stays exactly the same!
    );
  }
}