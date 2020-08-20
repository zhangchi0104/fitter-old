// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ExerciseRecord extends DataClass implements Insertable<ExerciseRecord> {
  final int id;
  final int amountPerSet;
  final int numSets;
  final String name;
  ExerciseRecord(
      {@required this.id,
      @required this.amountPerSet,
      @required this.numSets,
      @required this.name});
  factory ExerciseRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ExerciseRecord(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      amountPerSet:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      numSets:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}num_sets']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || amountPerSet != null) {
      map['amount'] = Variable<int>(amountPerSet);
    }
    if (!nullToAbsent || numSets != null) {
      map['num_sets'] = Variable<int>(numSets);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  ExerciseRecordsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseRecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      amountPerSet: amountPerSet == null && nullToAbsent
          ? const Value.absent()
          : Value(amountPerSet),
      numSets: numSets == null && nullToAbsent
          ? const Value.absent()
          : Value(numSets),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory ExerciseRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExerciseRecord(
      id: serializer.fromJson<int>(json['id']),
      amountPerSet: serializer.fromJson<int>(json['amountPerSet']),
      numSets: serializer.fromJson<int>(json['numSets']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amountPerSet': serializer.toJson<int>(amountPerSet),
      'numSets': serializer.toJson<int>(numSets),
      'name': serializer.toJson<String>(name),
    };
  }

  ExerciseRecord copyWith(
          {int id, int amountPerSet, int numSets, String name}) =>
      ExerciseRecord(
        id: id ?? this.id,
        amountPerSet: amountPerSet ?? this.amountPerSet,
        numSets: numSets ?? this.numSets,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseRecord(')
          ..write('id: $id, ')
          ..write('amountPerSet: $amountPerSet, ')
          ..write('numSets: $numSets, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(amountPerSet.hashCode, $mrjc(numSets.hashCode, name.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExerciseRecord &&
          other.id == this.id &&
          other.amountPerSet == this.amountPerSet &&
          other.numSets == this.numSets &&
          other.name == this.name);
}

class ExerciseRecordsCompanion extends UpdateCompanion<ExerciseRecord> {
  final Value<int> id;
  final Value<int> amountPerSet;
  final Value<int> numSets;
  final Value<String> name;
  const ExerciseRecordsCompanion({
    this.id = const Value.absent(),
    this.amountPerSet = const Value.absent(),
    this.numSets = const Value.absent(),
    this.name = const Value.absent(),
  });
  ExerciseRecordsCompanion.insert({
    this.id = const Value.absent(),
    @required int amountPerSet,
    @required int numSets,
    @required String name,
  })  : amountPerSet = Value(amountPerSet),
        numSets = Value(numSets),
        name = Value(name);
  static Insertable<ExerciseRecord> custom({
    Expression<int> id,
    Expression<int> amountPerSet,
    Expression<int> numSets,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amountPerSet != null) 'amount': amountPerSet,
      if (numSets != null) 'num_sets': numSets,
      if (name != null) 'name': name,
    });
  }

  ExerciseRecordsCompanion copyWith(
      {Value<int> id,
      Value<int> amountPerSet,
      Value<int> numSets,
      Value<String> name}) {
    return ExerciseRecordsCompanion(
      id: id ?? this.id,
      amountPerSet: amountPerSet ?? this.amountPerSet,
      numSets: numSets ?? this.numSets,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amountPerSet.present) {
      map['amount'] = Variable<int>(amountPerSet.value);
    }
    if (numSets.present) {
      map['num_sets'] = Variable<int>(numSets.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseRecordsCompanion(')
          ..write('id: $id, ')
          ..write('amountPerSet: $amountPerSet, ')
          ..write('numSets: $numSets, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ExerciseRecordsTable extends ExerciseRecords
    with TableInfo<$ExerciseRecordsTable, ExerciseRecord> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExerciseRecordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _amountPerSetMeta =
      const VerificationMeta('amountPerSet');
  GeneratedIntColumn _amountPerSet;
  @override
  GeneratedIntColumn get amountPerSet =>
      _amountPerSet ??= _constructAmountPerSet();
  GeneratedIntColumn _constructAmountPerSet() {
    return GeneratedIntColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numSetsMeta = const VerificationMeta('numSets');
  GeneratedIntColumn _numSets;
  @override
  GeneratedIntColumn get numSets => _numSets ??= _constructNumSets();
  GeneratedIntColumn _constructNumSets() {
    return GeneratedIntColumn(
      'num_sets',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  @override
  List<GeneratedColumn> get $columns => [id, amountPerSet, numSets, name];
  @override
  $ExerciseRecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercise_records';
  @override
  final String actualTableName = 'exercise_records';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(
          _amountPerSetMeta,
          amountPerSet.isAcceptableOrUnknown(
              data['amount'], _amountPerSetMeta));
    } else if (isInserting) {
      context.missing(_amountPerSetMeta);
    }
    if (data.containsKey('num_sets')) {
      context.handle(_numSetsMeta,
          numSets.isAcceptableOrUnknown(data['num_sets'], _numSetsMeta));
    } else if (isInserting) {
      context.missing(_numSetsMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseRecord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ExerciseRecord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExerciseRecordsTable createAlias(String alias) {
    return $ExerciseRecordsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ExerciseRecordsTable _exerciseRecords;
  $ExerciseRecordsTable get exerciseRecords =>
      _exerciseRecords ??= $ExerciseRecordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [exerciseRecords];
}
