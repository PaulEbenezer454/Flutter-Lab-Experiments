import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Web Application')),
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return const Text('Mobile Web Layout', style: TextStyle(fontSize: 24));
              }
              return const Text('Desktop Web Layout', style: TextStyle(fontSize: 24));
            },
          ),
        ),
      ),
    );
  }
}
