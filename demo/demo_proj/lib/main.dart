import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF141116),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'How we doin?',
                style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              SizedBox(height: 20), // Adds 20 pixels of vertical space 📏
              ElevatedButton(
                onPressed: () {
                  // Action goes here later!
                },
                child: Text('Make a Decision'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}