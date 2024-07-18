import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'hadith_db.db');

    final exists = await databaseExists(path);

    if (!exists) {
      // Copy from asset
      try {
        await Directory(dirname(path)).create(recursive: true);

        // Copy from asset
        ByteData data = await rootBundle.load(join('assets', 'hadith_db.db'));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        // Write and flush the bytes written
        await File(path).writeAsBytes(bytes, flush: true);
      } catch (e) {
        throw Exception('Error copying database: $e');
      }
    }
    return await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> getBookList() async {
    final db = await database;
    return await db.query('books'); // Books table
  }

  Future<List<Map<String, dynamic>>> getChapterlist() async {
    final db = await database;
    return await db.query('chapter'); // Chapter table
  }

  Future<List<Map<String, dynamic>>> getHadithList() async {
    final db = await database;
    return await db.query('hadith'); // Hadith table
  }

  Future<List<Map<String, dynamic>>> getSectionList() async {
    final db = await database;
    return await db.query('section'); // Hadith table
  }
}
