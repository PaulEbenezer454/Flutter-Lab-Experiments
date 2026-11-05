import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'students.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE students(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            course TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertStudent(String name, String course) async {
    final db = await database;
    return db.insert('students', {'name': name, 'course': course});
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await database;
    return db.query('students', orderBy: 'id DESC');
  }

  Future<int> updateStudent(int id, String name, String course) async {
    final db = await database;
    return db.update('students', {'name': name, 'course': course},
        where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;
    return db.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}
