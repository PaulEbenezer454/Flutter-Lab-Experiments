import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Responsive Layout')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Card(child: ListTile(title: Text('Mobile Card 1'))),
                  Card(child: ListTile(title: Text('Mobile Card 2'))),
                ],
              );
            }
            return Row(
              children: const [
                Expanded(child: Card(child: ListTile(title: Text('Desktop Card 1')))),
                Expanded(child: Card(child: ListTile(title: Text('Desktop Card 2')))),
              ],
            );
          },
        ),
      ),
    );
  }
}
