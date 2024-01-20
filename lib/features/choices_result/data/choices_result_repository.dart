import 'package:test_task/core/services/db/database_service.dart';

import '../../../core/services/db/app_drift_database/app_drift_database.dart';

abstract class ChoicesResultRepository {
  Stream<int> watchAllAttempts();
  Stream<List<Character>> watchCharacters();
}

class ChoicesResultRepositoryImpl implements ChoicesResultRepository {
  final DatabaseService _databaseService;

  ChoicesResultRepositoryImpl(this._databaseService);

  @override
  Stream<int> watchAllAttempts() {
    return _databaseService.watchAllAttempts();
  }

  @override
  Stream<List<Character>> watchCharacters() {
    return _databaseService.watchCharacters();
  }
}
