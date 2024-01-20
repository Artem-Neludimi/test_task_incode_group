part of 'random_character_bloc.dart';

@immutable
sealed class RandomCharacterEvent {
  const RandomCharacterEvent();
}

class RandomCharacterStarted extends RandomCharacterEvent {
  const RandomCharacterStarted(this.allCharacters);

  final List<CharacterModel> allCharacters;
}

class RandomCharacterNewCharacter extends RandomCharacterEvent {
  const RandomCharacterNewCharacter();
}

class RandomCharacterHouseGuess extends RandomCharacterEvent {
  const RandomCharacterHouseGuess(this.house);

  final House house;
}

class RandomCharacterReset extends RandomCharacterEvent {
  const RandomCharacterReset();
}