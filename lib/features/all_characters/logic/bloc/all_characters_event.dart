part of 'all_characters_bloc.dart';

@immutable
sealed class AllCharactersEvent {
  const AllCharactersEvent();
}

class AllCharactersStarted extends AllCharactersEvent {
  const AllCharactersStarted();
}
