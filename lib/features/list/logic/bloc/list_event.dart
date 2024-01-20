part of 'list_bloc.dart';

@immutable
sealed class ListEvent {
  const ListEvent();
}

class ListStarted extends ListEvent {
  const ListStarted(this.characters);

  final List<CharacterModel> characters;
}

class ListFindCharacter extends ListEvent {
  const ListFindCharacter(this.text);

  final String text;
}