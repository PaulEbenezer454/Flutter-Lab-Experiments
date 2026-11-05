import 'package:flutter/material.dart';
import 'student.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StudentPage(),
  );
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final List<String> students = [];

  @override
  void initState() {
    super.initState();
    final student = Student(id: 1, name: 'Raj', course: 'CSE');
    final jsonData = student.toJson();
    debugPrint('JSON Map: $jsonData');
    final restoredStudent = Student.fromJson(jsonData);
    debugPrint('Restored name: ${restoredStudent.name}');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Student State Management')),
    body: Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => students.add('Raj')),
          child: const Text('Add Student'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.person),
              title: Text(students[index]),
            ),
          ),
        ),
      ],
    ),
  );
}
