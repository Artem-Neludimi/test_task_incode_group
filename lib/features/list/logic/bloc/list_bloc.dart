import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/core/extensions/string_extensions.dart';
import 'package:test_task/features/list/data/list_repository.dart';
import 'package:test_task/features/list/domain/list_character.dart';

import '../../../../core/services/api/models/character_model/character_model.dart';

part 'list_event.dart';

class ListBloc extends Bloc<ListEvent, List<CharacterListData>> {
  final ListRepository _repository;

  ListBloc(this._repository) : super([]) {
    on<ListEvent>(
      (event, emit) => switch (event) {
        ListStarted() => _onStarted(event, emit),
        ListFindCharacter() => _onFindCharacter(event, emit),
      },
    );
  }

  late List<CharacterListData> _processedCharacters;

  Future<void> _onStarted(ListStarted event, Emitter<List<CharacterListData>> emit) async {
    final charactersInDb = await _repository.getAllCharacters();

    final list = <CharacterListData>[];

    for (final characterInDb in charactersInDb) {
      final characterModel = findCharacterModelById(characterInDb.id, event.characters);

      list.add(CharacterListData(
        id: characterInDb.id,
        name: characterModel.name,
        image: characterModel.image,
        isGuessed: characterInDb.isGuessed,
        attempts: characterInDb.attempts,
        actor: characterModel.actor,
        dateOfBirth: characterModel.dateOfBirth,
        house: characterModel.house.name.capitalized(),
        species: characterModel.species,
      ));
    }
    _processedCharacters = list;
    emit(list);
  }

  Future<void> _onFindCharacter(ListFindCharacter event, Emitter<List<CharacterListData>> emit) async {
    final text = event.text.toLowerCase();
    if (text.isEmpty) {
      emit(_processedCharacters);
      return;
    }
    final foundByName = _processedCharacters.where((element) => element.name.toLowerCase().contains(text)).toList();
    emit(foundByName);
  }

  CharacterModel findCharacterModelById(String id, List<CharacterModel> allCharacters) {
    return allCharacters.firstWhere((element) => element.id == id);
  }
}
