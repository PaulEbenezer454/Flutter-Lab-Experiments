import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Layout Widgets')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Flutter Layout Demo', style: TextStyle(fontSize: 24)),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                color: Colors.blue.shade100,
                child: const Text('Container with padding and margin'),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, size: 35),
                  Icon(Icons.person, size: 35),
                  Icon(Icons.settings, size: 35),
                ],
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Student Details'),
                  subtitle: Text('Computer Science Engineering'),
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(leading: Icon(Icons.book), title: Text('Computer Networks')),
                  ListTile(leading: Icon(Icons.code), title: Text('Programming')),
                  ListTile(leading: Icon(Icons.storage), title: Text('Database Systems')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
