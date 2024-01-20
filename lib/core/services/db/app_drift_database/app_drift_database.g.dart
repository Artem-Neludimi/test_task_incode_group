// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_drift_database.dart';

// ignore_for_file: type=lint
class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isGuessedMeta =
      const VerificationMeta('isGuessed');
  @override
  late final GeneratedColumn<bool> isGuessed = GeneratedColumn<bool>(
      'is_guessed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_guessed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, attempts, isGuessed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(Insertable<Character> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    } else if (isInserting) {
      context.missing(_attemptsMeta);
    }
    if (data.containsKey('is_guessed')) {
      context.handle(_isGuessedMeta,
          isGuessed.isAcceptableOrUnknown(data['is_guessed']!, _isGuessedMeta));
    } else if (isInserting) {
      context.missing(_isGuessedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      isGuessed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_guessed'])!,
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  final String id;
  final int attempts;
  final bool isGuessed;
  const Character(
      {required this.id, required this.attempts, required this.isGuessed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['attempts'] = Variable<int>(attempts);
    map['is_guessed'] = Variable<bool>(isGuessed);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      attempts: Value(attempts),
      isGuessed: Value(isGuessed),
    );
  }

  factory Character.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<String>(json['id']),
      attempts: serializer.fromJson<int>(json['attempts']),
      isGuessed: serializer.fromJson<bool>(json['isGuessed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'attempts': serializer.toJson<int>(attempts),
      'isGuessed': serializer.toJson<bool>(isGuessed),
    };
  }

  Character copyWith({String? id, int? attempts, bool? isGuessed}) => Character(
        id: id ?? this.id,
        attempts: attempts ?? this.attempts,
        isGuessed: isGuessed ?? this.isGuessed,
      );
  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('attempts: $attempts, ')
          ..write('isGuessed: $isGuessed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, attempts, isGuessed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.attempts == this.attempts &&
          other.isGuessed == this.isGuessed);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<String> id;
  final Value<int> attempts;
  final Value<bool> isGuessed;
  final Value<int> rowid;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.attempts = const Value.absent(),
    this.isGuessed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharactersCompanion.insert({
    required String id,
    required int attempts,
    required bool isGuessed,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        attempts = Value(attempts),
        isGuessed = Value(isGuessed);
  static Insertable<Character> custom({
    Expression<String>? id,
    Expression<int>? attempts,
    Expression<bool>? isGuessed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (attempts != null) 'attempts': attempts,
      if (isGuessed != null) 'is_guessed': isGuessed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharactersCompanion copyWith(
      {Value<String>? id,
      Value<int>? attempts,
      Value<bool>? isGuessed,
      Value<int>? rowid}) {
    return CharactersCompanion(
      id: id ?? this.id,
      attempts: attempts ?? this.attempts,
      isGuessed: isGuessed ?? this.isGuessed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (isGuessed.present) {
      map['is_guessed'] = Variable<bool>(isGuessed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('attempts: $attempts, ')
          ..write('isGuessed: $isGuessed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDriftDatabase extends GeneratedDatabase {
  _$AppDriftDatabase(QueryExecutor e) : super(e);
  late final $CharactersTable characters = $CharactersTable(this);
  late final CharacterDao characterDao = CharacterDao(this as AppDriftDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [characters];
}

mixin _$CharacterDaoMixin on DatabaseAccessor<AppDriftDatabase> {
  $CharactersTable get characters => attachedDatabase.characters;
}
