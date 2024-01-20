// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      house: $enumDecode(_$HouseEnumMap, json['house']),
      image: json['image'] as String,
      dateOfBirth: json['dateOfBirth'] as String?,
      actor: json['actor'] as String,
      species: json['species'] as String,
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'house': _$HouseEnumMap[instance.house]!,
      'image': instance.image,
      'dateOfBirth': instance.dateOfBirth,
      'actor': instance.actor,
      'species': instance.species,
    };

const _$HouseEnumMap = {
  House.gryffindor: 'Gryffindor',
  House.slytherin: 'Slytherin',
  House.ravenclaw: 'Ravenclaw',
  House.hufflepuff: 'Hufflepuff',
  House.notInHouse: '',
};
