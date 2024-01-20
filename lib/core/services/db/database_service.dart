import 'dart:io';
import 'dart:developer' as developer;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:test_task/core/services/db/app_drift_database/app_drift_database.dart';

abstract class DatabaseService {
  Future<void> init();
  Future<void> insertCharacter(String id);
  Future<List<Character>> getAllCharacters();
  Stream<List<Character>> watchCharacters();
  Stream<int> watchAllAttempts();
  Future<void> incrementAttempts(String id);
  Future<void> setGuessed(String id);
  Future<void> clear();
}

class DatabaseServiceImpl implements DatabaseService {
  late AppDriftDatabase _db;

  @override
  Future<void> init() async {
    final db = _openConnection();
    _db = AppDriftDatabase(db);
    developer.log('Database initialized', name: 'DatabaseService');
  }

  @override
  Future<void> insertCharacter(String id) async {
    await _db.characterDao.insertCharacter(id);
  }

  @override
  Future<List<Character>> getAllCharacters() async {
    return await _db.characterDao.getAllCharacters();
  }

  @override
  Stream<List<Character>> watchCharacters() => _db.characterDao.watchCharacters();

  @override
  Stream<int> watchAllAttempts() {
    return _db.characterDao.watchAllAttempts();
  }

  @override
  Future<void> incrementAttempts(String id) async {
    await _db.characterDao.incrementAttempts(id);
  }

  @override
  Future<void> setGuessed(String id) async {
    await _db.characterDao.setGuessed(id);
  }

  @override
  Future<void> clear() async {
    await _db.characterDao.clear();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
