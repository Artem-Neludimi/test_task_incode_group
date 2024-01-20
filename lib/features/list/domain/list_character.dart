class CharacterListData {
  const CharacterListData({
    required this.id,
    required this.name,
    required this.house,
    required this.dateOfBirth,
    required this.actor,
    required this.species,
    required this.image,
    required this.attempts,
    required this.isGuessed,
  });

  final String id;
  final String name;
  final String house;
  final String? dateOfBirth;
  final String actor;
  final String species;
  final String image;
  final int attempts;
  final bool isGuessed;
}
