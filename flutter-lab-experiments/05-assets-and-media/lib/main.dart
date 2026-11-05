import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Gallery')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Image.asset('assets/images/flutter.png', height: 160, fit: BoxFit.contain),
              const Text('Flutter Image', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  Image.asset('assets/images/flutter.png'),
                  Image.asset('assets/images/flutter.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
