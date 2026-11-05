import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirebaseStudentPage(),
  );
}

class FirebaseStudentPage extends StatefulWidget {
  const FirebaseStudentPage({super.key});

  @override
  State<FirebaseStudentPage> createState() => _FirebaseStudentPageState();
}

class _FirebaseStudentPageState extends State<FirebaseStudentPage> {
  final nameController = TextEditingController();
  final courseController = TextEditingController();
  final students = FirebaseFirestore.instance.collection('students');

  Future<void> addStudent() async {
    if (nameController.text.trim().isEmpty || courseController.text.trim().isEmpty) return;
    await students.add({
      'name': nameController.text.trim(),
      'course': courseController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });
    nameController.clear();
    courseController.clear();
  }

  Future<void> updateStudent(String id, String name, String course) async {
    await students.doc(id).update({'name': name, 'course': course});
  }

  Future<void> deleteStudent(String id) async {
    await students.doc(id).delete();
  }

  @override
  void dispose() {
    nameController.dispose();
    courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Firebase Student Records')),
    body: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Student Name')),
          TextField(controller: courseController, decoration: const InputDecoration(labelText: 'Course')),
          ElevatedButton(onPressed: addStudent, child: const Text('Add Student')),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: students.orderBy('createdAt', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return const Center(child: Text('Something went wrong'));
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    final data = doc.data();
                    return ListTile(
                      title: Text(data['name'] ?? ''),
                      subtitle: Text(data['course'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteStudent(doc.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
