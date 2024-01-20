import 'package:drift/drift.dart';

import '../tables/characters_drift.dart';

part 'app_drift_database.g.dart';

@DriftDatabase(
  tables: [Characters],
  daos: [CharacterDao],
)
class AppDriftDatabase extends _$AppDriftDatabase {
  AppDriftDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [Characters])
class CharacterDao extends DatabaseAccessor<AppDriftDatabase> with _$CharacterDaoMixin {
  final AppDriftDatabase db;

  CharacterDao(this.db) : super(db);

  Future<void> insertCharacter(String id) => into(characters).insert(Character(id: id, attempts: 0, isGuessed: false));

  Future<void> incrementAttempts(String id) async {
    final character = await (select(characters)..where((c) => c.id.equals(id))).getSingle();

    await (update(characters)..where((c) => c.id.equals(id)))
        .write(character.copyWith(attempts: character.attempts + 1));
  }

  Future<List<Character>> getAllCharacters() => select(characters).get();

  Stream<int> watchAllAttempts() {
    return select(characters).map((c) => c.attempts).watch().map((allAttemptList) {
      if (allAttemptList.isEmpty) return 0;
      return allAttemptList.reduce((value, element) => value + element);
    });
  }

  Stream<List<Character>> watchCharacters() => select(characters).watch();

  Future<void> setGuessed(String id) async {
    final character = await (select(characters)..where((c) => c.id.equals(id))).getSingle();
    await (update(characters)..where((c) => c.id.equals(id))).write(character.copyWith(isGuessed: true));
  }

  Future<void> clear() => delete(characters).go();
}
