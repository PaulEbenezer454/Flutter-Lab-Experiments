import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StudentDatabasePage(),
  );
}

class StudentDatabasePage extends StatefulWidget {
  const StudentDatabasePage({super.key});

  @override
  State<StudentDatabasePage> createState() => _StudentDatabasePageState();
}

class _StudentDatabasePageState extends State<StudentDatabasePage> {
  final nameController = TextEditingController();
  final courseController = TextEditingController();
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    final data = await DatabaseHelper.instance.getStudents();
    if (!mounted) return;
    setState(() => students = data);
  }

  Future<void> addStudent() async {
    if (nameController.text.trim().isEmpty || courseController.text.trim().isEmpty) return;
    await DatabaseHelper.instance.insertStudent(
      nameController.text.trim(), courseController.text.trim());
    nameController.clear();
    courseController.clear();
    await loadStudents();
  }

  Future<void> editStudent(Map<String, dynamic> student) async {
    nameController.text = student['name'] as String;
    courseController.text = student['course'] as String;
    final save = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Update Student'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: courseController, decoration: const InputDecoration(labelText: 'Course')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(dialogContext, true), child: const Text('Save')),
        ],
      ),
    );
    if (save == true) {
      await DatabaseHelper.instance.updateStudent(
        student['id'] as int, nameController.text.trim(), courseController.text.trim());
      await loadStudents();
    }
    nameController.clear();
    courseController.clear();
  }

  Future<void> removeStudent(int id) async {
    await DatabaseHelper.instance.deleteStudent(id);
    await loadStudents();
  }

  @override
  void dispose() {
    nameController.dispose();
    courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('SQLite Student Database')),
    body: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Student Name')),
          TextField(controller: courseController, decoration: const InputDecoration(labelText: 'Course')),
          ElevatedButton(onPressed: addStudent, child: const Text('Add Student')),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  title: Text(student['name'] as String),
                  subtitle: Text(student['course'] as String),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: const Icon(Icons.edit), onPressed: () => editStudent(student)),
                      IconButton(icon: const Icon(Icons.delete),
                          onPressed: () => removeStudent(student['id'] as int)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
