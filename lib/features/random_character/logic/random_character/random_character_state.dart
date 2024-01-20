part of 'random_character_bloc.dart';

class RandomCharacterState {
  RandomCharacterState({
    this.allCharacters = const [],
    this.randomCharacter,
    this.pickedHouses = const [],
    this.guessedAllCharacters = false,
  });

  final List<CharacterModel> allCharacters;
  final CharacterModel? randomCharacter;
  final List<House> pickedHouses;
  final bool guessedAllCharacters;

  RandomCharacterState copyWith({
    List<CharacterModel>? allCharacters,
    CharacterModel? randomCharacter,
    List<House>? pickedHouses,
    bool? guessedAllCharacters,
  }) {
    return RandomCharacterState(
      allCharacters: allCharacters ?? this.allCharacters,
      randomCharacter: randomCharacter ?? this.randomCharacter,
      pickedHouses: pickedHouses ?? this.pickedHouses,
      guessedAllCharacters: guessedAllCharacters ?? this.guessedAllCharacters,
    );
  }

  RandomCharacterState reset() {
    return RandomCharacterState(
      allCharacters: allCharacters,
      randomCharacter: null,
      pickedHouses: [],
    );
  }

  bool? isRightHouse(House house) {
    if (!pickedHouses.contains(house)) return null;
    if (guessedAllCharacters) return null;
    return randomCharacter?.house == house;
  }

  bool get isRightHouseGuess {
    if (pickedHouses.isEmpty) return false;
    return randomCharacter?.house == pickedHouses.last;
  }
}
