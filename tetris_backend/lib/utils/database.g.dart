// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nicknameMeta =
      const VerificationMeta('nickname');
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
      'nickname', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nickname];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nickname')) {
      context.handle(_nicknameMeta,
          nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta));
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDto(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nickname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nickname'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserDto extends DataClass implements Insertable<UserDto> {
  final int id;
  final String nickname;
  const UserDto({required this.id, required this.nickname});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nickname'] = Variable<String>(nickname);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      nickname: Value(nickname),
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDto(
      id: serializer.fromJson<int>(json['id']),
      nickname: serializer.fromJson<String>(json['nickname']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nickname': serializer.toJson<String>(nickname),
    };
  }

  UserDto copyWith({int? id, String? nickname}) => UserDto(
        id: id ?? this.id,
        nickname: nickname ?? this.nickname,
      );
  UserDto copyWithCompanion(UsersCompanion data) {
    return UserDto(
      id: data.id.present ? data.id.value : this.id,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDto(')
          ..write('id: $id, ')
          ..write('nickname: $nickname')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nickname);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDto &&
          other.id == this.id &&
          other.nickname == this.nickname);
}

class UsersCompanion extends UpdateCompanion<UserDto> {
  final Value<int> id;
  final Value<String> nickname;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.nickname = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String nickname,
  }) : nickname = Value(nickname);
  static Insertable<UserDto> custom({
    Expression<int>? id,
    Expression<String>? nickname,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nickname != null) 'nickname': nickname,
    });
  }

  UsersCompanion copyWith({Value<int>? id, Value<String>? nickname}) {
    return UsersCompanion(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('nickname: $nickname')
          ..write(')'))
        .toString();
  }
}

class $GameScoresTable extends GameScores
    with TableInfo<$GameScoresTable, GameScoreDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, userId, score, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_scores';
  @override
  VerificationContext validateIntegrity(Insertable<GameScoreDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameScoreDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameScoreDto(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $GameScoresTable createAlias(String alias) {
    return $GameScoresTable(attachedDatabase, alias);
  }
}

class GameScoreDto extends DataClass implements Insertable<GameScoreDto> {
  final int id;
  final int userId;
  final int score;
  final DateTime createdAt;
  const GameScoreDto(
      {required this.id,
      required this.userId,
      required this.score,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['score'] = Variable<int>(score);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GameScoresCompanion toCompanion(bool nullToAbsent) {
    return GameScoresCompanion(
      id: Value(id),
      userId: Value(userId),
      score: Value(score),
      createdAt: Value(createdAt),
    );
  }

  factory GameScoreDto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameScoreDto(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      score: serializer.fromJson<int>(json['score']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'score': serializer.toJson<int>(score),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GameScoreDto copyWith(
          {int? id, int? userId, int? score, DateTime? createdAt}) =>
      GameScoreDto(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        score: score ?? this.score,
        createdAt: createdAt ?? this.createdAt,
      );
  GameScoreDto copyWithCompanion(GameScoresCompanion data) {
    return GameScoreDto(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      score: data.score.present ? data.score.value : this.score,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameScoreDto(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('score: $score, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, score, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameScoreDto &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.score == this.score &&
          other.createdAt == this.createdAt);
}

class GameScoresCompanion extends UpdateCompanion<GameScoreDto> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> score;
  final Value<DateTime> createdAt;
  const GameScoresCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.score = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GameScoresCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int score,
    this.createdAt = const Value.absent(),
  })  : userId = Value(userId),
        score = Value(score);
  static Insertable<GameScoreDto> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? score,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (score != null) 'score': score,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GameScoresCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? score,
      Value<DateTime>? createdAt}) {
    return GameScoresCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameScoresCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('score: $score, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $GameScoresTable gameScores = $GameScoresTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, gameScores];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String nickname,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> nickname,
});

class $$UsersTableFilterComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nickname => $composableBuilder(
      column: $table.nickname, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nickname => $composableBuilder(
      column: $table.nickname, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$Database,
    $UsersTable,
    UserDto,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserDto, BaseReferences<_$Database, $UsersTable, UserDto>),
    UserDto,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$Database db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nickname = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            nickname: nickname,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nickname,
          }) =>
              UsersCompanion.insert(
            id: id,
            nickname: nickname,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $UsersTable,
    UserDto,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserDto, BaseReferences<_$Database, $UsersTable, UserDto>),
    UserDto,
    PrefetchHooks Function()>;
typedef $$GameScoresTableCreateCompanionBuilder = GameScoresCompanion Function({
  Value<int> id,
  required int userId,
  required int score,
  Value<DateTime> createdAt,
});
typedef $$GameScoresTableUpdateCompanionBuilder = GameScoresCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<int> score,
  Value<DateTime> createdAt,
});

class $$GameScoresTableFilterComposer
    extends Composer<_$Database, $GameScoresTable> {
  $$GameScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$GameScoresTableOrderingComposer
    extends Composer<_$Database, $GameScoresTable> {
  $$GameScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$GameScoresTableAnnotationComposer
    extends Composer<_$Database, $GameScoresTable> {
  $$GameScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$GameScoresTableTableManager extends RootTableManager<
    _$Database,
    $GameScoresTable,
    GameScoreDto,
    $$GameScoresTableFilterComposer,
    $$GameScoresTableOrderingComposer,
    $$GameScoresTableAnnotationComposer,
    $$GameScoresTableCreateCompanionBuilder,
    $$GameScoresTableUpdateCompanionBuilder,
    (GameScoreDto, BaseReferences<_$Database, $GameScoresTable, GameScoreDto>),
    GameScoreDto,
    PrefetchHooks Function()> {
  $$GameScoresTableTableManager(_$Database db, $GameScoresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> score = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              GameScoresCompanion(
            id: id,
            userId: userId,
            score: score,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required int score,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              GameScoresCompanion.insert(
            id: id,
            userId: userId,
            score: score,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GameScoresTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $GameScoresTable,
    GameScoreDto,
    $$GameScoresTableFilterComposer,
    $$GameScoresTableOrderingComposer,
    $$GameScoresTableAnnotationComposer,
    $$GameScoresTableCreateCompanionBuilder,
    $$GameScoresTableUpdateCompanionBuilder,
    (GameScoreDto, BaseReferences<_$Database, $GameScoresTable, GameScoreDto>),
    GameScoreDto,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$GameScoresTableTableManager get gameScores =>
      $$GameScoresTableTableManager(_db, _db.gameScores);
}
