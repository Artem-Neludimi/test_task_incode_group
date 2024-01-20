import 'package:test_task/core/services/api/models/character_model/character_model.dart';

import '../../../core/services/api/api_service.dart';

abstract class AllCharactersRepository {
  Future<List<CharacterModel>> getAllCharacters();
}

class AllCharactersRepositoryImpl implements AllCharactersRepository {
  AllCharactersRepositoryImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    return await apiService.getAllCharacters();
  }
}
