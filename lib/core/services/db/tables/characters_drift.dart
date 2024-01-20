import 'package:drift/drift.dart';

class Characters extends Table {
  TextColumn get id => text()();
  IntColumn get attempts => integer()();
  BoolColumn get isGuessed => boolean()();
}
