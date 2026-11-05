import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimationPage(),
  );
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool isLarge = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Animated Container')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: isLarge ? 300 : 150,
            height: isLarge ? 300 : 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Flutter', style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => setState(() => isLarge = !isLarge),
            child: const Text('Animate'),
          ),
        ],
      ),
    ),
  );
}
