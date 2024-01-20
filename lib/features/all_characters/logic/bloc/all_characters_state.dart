part of 'all_characters_bloc.dart';

@immutable
sealed class AllCharactersState {
  const AllCharactersState();
}

class AllCharactersInitial extends AllCharactersState {
  const AllCharactersInitial();
}

class AllCharactersLoaded extends AllCharactersState {
  const AllCharactersLoaded(this.allCharacters);

  final List<CharacterModel> allCharacters;
}

class AllCharactersError extends AllCharactersState {
  const AllCharactersError(this.message);

  final String message;
}
