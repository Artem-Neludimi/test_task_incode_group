import 'package:dio/dio.dart';
import 'package:test_task/core/services/api/models/character_model/character_model.dart';

import 'api_config.dart';
import 'hp_api/hp_api_client.dart';

abstract class ApiService {
  Future<List<CharacterModel>> getAllCharacters();
}

class ApiServiceImpl implements ApiService {
  Dio get _dio => Dio();

  HpApiClient get _hpApiClient => HpApiClient(_dio, baseUrl: ApiConfig.hpApiBaseUrl);

  @override
  Future<List<CharacterModel>> getAllCharacters() {
    return _hpApiClient.getAllCharacters();
  }
}
