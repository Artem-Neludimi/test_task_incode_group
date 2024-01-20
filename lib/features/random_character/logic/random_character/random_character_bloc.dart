import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/features/random_character/data/random_characters_repository.dart';

import '../../../../core/services/api/models/character_model/character_model.dart';

part 'random_character_event.dart';
part 'random_character_state.dart';

class RandomCharacterBloc extends Bloc<RandomCharacterEvent, RandomCharacterState> {
  final RandomCharacterRepository _repository;

  RandomCharacterBloc(this._repository) : super(RandomCharacterState()) {
    on<RandomCharacterEvent>(
      (event, emit) => switch (event) {
        RandomCharacterStarted() => _onStarted(event, emit),
        RandomCharacterNewCharacter() => _onNewCharacter(emit),
        RandomCharacterHouseGuess() => _onHouseGuess(event, emit),
        RandomCharacterReset() => _onReset(emit),
      },
    );
  }

  late List<CharacterModel> initialCharacterList;

  Future<void> _onStarted(RandomCharacterStarted event, Emitter<RandomCharacterState> emit) async {
    if (state.randomCharacter != null) {
      return;
    }

    initialCharacterList = event.allCharacters;

    final charactersInBD = await _repository.getCharactersInBD();
    final allCharacters =
        event.allCharacters.where((element) => !charactersInBD.map((e) => e.id).contains(element.id)).toList();

    emit(state.copyWith(allCharacters: allCharacters));
    add(const RandomCharacterNewCharacter());
  }

  Future<void> _onNewCharacter(Emitter<RandomCharacterState> emit) async {
    emit(state.reset());

    if (state.allCharacters.isEmpty) {
      emit(state.copyWith(guessedAllCharacters: true));
      return;
    }

    final randomCharacter = _getRandomCharacter(state.allCharacters);
    final newCharacterList = state.allCharacters.where((element) => element.id != randomCharacter.id).toList();

    emit(state.copyWith(
      randomCharacter: randomCharacter,
      allCharacters: newCharacterList,
    ));
  }

  Future<void> _onHouseGuess(RandomCharacterHouseGuess event, Emitter<RandomCharacterState> emit) async {
    if (state.pickedHouses.isEmpty) {
      await _repository.insertCharacter(state.randomCharacter!.id);
    }

    final randomCharacter = state.randomCharacter!;

    final newPickedHouses = [...state.pickedHouses, event.house];
    emit(state.copyWith(pickedHouses: newPickedHouses));

    await _repository.incrementAttempts(randomCharacter.id);

    if (randomCharacter.house == event.house) {
      await _repository.setGuessed(randomCharacter.id);
      await Future.delayed(const Duration(milliseconds: 1500));
      add(const RandomCharacterNewCharacter());
    }
  }

  Future<void> _onReset(Emitter<RandomCharacterState> emit) async {
    emit(state.reset());
    emit(state.copyWith(allCharacters: initialCharacterList));

    await _repository.clear();
    add(const RandomCharacterNewCharacter());
  }

  CharacterModel _getRandomCharacter(List<CharacterModel> allCharacters) {
    final random = math.Random();
    final index = random.nextInt(allCharacters.length);
    return allCharacters[index];
  }
}
