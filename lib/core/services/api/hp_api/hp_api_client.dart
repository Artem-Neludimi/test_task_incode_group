import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/character_model/character_model.dart';

part 'hp_api_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class HpApiClient {
  factory HpApiClient(Dio dio, {String baseUrl}) = _HpApiClient;

  @GET('/characters')
  Future<List<CharacterModel>> getAllCharacters();
}
