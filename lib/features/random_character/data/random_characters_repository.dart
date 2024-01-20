import 'package:test_task/core/services/db/app_drift_database/app_drift_database.dart';
import 'package:test_task/core/services/db/database_service.dart';

abstract class RandomCharacterRepository {
  Future<List<Character>> getCharactersInBD();
  Future<void> insertCharacter(String id);
  Future<void> incrementAttempts(String id);
  Future<void> setGuessed(String id);
  Future<void> clear();
}

class RandomCharacterRepositoryImpl implements RandomCharacterRepository {
  final DatabaseService _databaseService;

  RandomCharacterRepositoryImpl(this._databaseService);

  @override
  Future<List<Character>> getCharactersInBD() async {
    return await _databaseService.getAllCharacters();
  }

  @override
  Future<void> insertCharacter(String id) async {
    await _databaseService.insertCharacter(id);
  }

  @override
  Future<void> incrementAttempts(String id) async {
    await _databaseService.incrementAttempts(id);
  }

  @override
  Future<void> setGuessed(String id) async {
    await _databaseService.setGuessed(id);
  }

  @override
  Future<void> clear() async {
    await _databaseService.clear();
  }
}
