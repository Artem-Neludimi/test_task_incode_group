import 'package:test_task/core/services/db/database_service.dart';

import '../../../core/services/db/app_drift_database/app_drift_database.dart';

abstract class ListRepository {
  Future<List<Character>> getAllCharacters();
}

class ListRepositoryImpl implements ListRepository {
  ListRepositoryImpl(this._databaseService);
  final DatabaseService _databaseService;

  @override
  Future<List<Character>> getAllCharacters() async {
    return await _databaseService.getAllCharacters();
  }
}
