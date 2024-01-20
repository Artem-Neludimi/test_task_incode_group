import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.house,
    required this.image,
    required this.dateOfBirth,
    required this.actor,
    required this.species,
  });

  final String id;
  final String name;
  final House house;
  final String image;
  final String? dateOfBirth;
  final String actor;
  final String species;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonEnum()
enum House {
  @JsonValue('Gryffindor')
  gryffindor,
  @JsonValue('Slytherin')
  slytherin,
  @JsonValue('Ravenclaw')
  ravenclaw,
  @JsonValue('Hufflepuff')
  hufflepuff,
  @JsonValue('')
  notInHouse,
  ;
}
