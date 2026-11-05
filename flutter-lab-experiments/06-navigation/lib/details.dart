import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Details')),
    body: Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Go Back'),
      ),
    ),
  );
}
