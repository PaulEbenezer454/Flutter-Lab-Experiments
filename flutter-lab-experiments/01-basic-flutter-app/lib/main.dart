import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Student Profile')),
        body: const Center(
          child: Text('Welcome to Flutter', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
