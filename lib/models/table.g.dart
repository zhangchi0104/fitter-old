// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ExerciseRecord extends DataClass implements Insertable<ExerciseRecord> {
  final int id;
  final int reps;
  final int weight;
  final int workoutEntryId;
  ExerciseRecord(
      {@required this.id,
      @required this.reps,
      @required this.weight,
      @required this.workoutEntryId});
  factory ExerciseRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ExerciseRecord(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      reps: intType.mapFromDatabaseResponse(data['${effectivePrefix}reps']),
      weight: intType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      workoutEntryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}workout_entry_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int>(weight);
    }
    if (!nullToAbsent || workoutEntryId != null) {
      map['workout_entry_id'] = Variable<int>(workoutEntryId);
    }
    return map;
  }

  ExerciseRecordsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseRecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      workoutEntryId: workoutEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutEntryId),
    );
  }

  factory ExerciseRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExerciseRecord(
      id: serializer.fromJson<int>(json['id']),
      reps: serializer.fromJson<int>(json['reps']),
      weight: serializer.fromJson<int>(json['weight']),
      workoutEntryId: serializer.fromJson<int>(json['workoutEntryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reps': serializer.toJson<int>(reps),
      'weight': serializer.toJson<int>(weight),
      'workoutEntryId': serializer.toJson<int>(workoutEntryId),
    };
  }

  ExerciseRecord copyWith({int id, int reps, int weight, int workoutEntryId}) =>
      ExerciseRecord(
        id: id ?? this.id,
        reps: reps ?? this.reps,
        weight: weight ?? this.weight,
        workoutEntryId: workoutEntryId ?? this.workoutEntryId,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseRecord(')
          ..write('id: $id, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('workoutEntryId: $workoutEntryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(reps.hashCode, $mrjc(weight.hashCode, workoutEntryId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExerciseRecord &&
          other.id == this.id &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.workoutEntryId == this.workoutEntryId);
}

class ExerciseRecordsCompanion extends UpdateCompanion<ExerciseRecord> {
  final Value<int> id;
  final Value<int> reps;
  final Value<int> weight;
  final Value<int> workoutEntryId;
  const ExerciseRecordsCompanion({
    this.id = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.workoutEntryId = const Value.absent(),
  });
  ExerciseRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    @required int workoutEntryId,
  }) : workoutEntryId = Value(workoutEntryId);
  static Insertable<ExerciseRecord> custom({
    Expression<int> id,
    Expression<int> reps,
    Expression<int> weight,
    Expression<int> workoutEntryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (workoutEntryId != null) 'workout_entry_id': workoutEntryId,
    });
  }

  ExerciseRecordsCompanion copyWith(
      {Value<int> id,
      Value<int> reps,
      Value<int> weight,
      Value<int> workoutEntryId}) {
    return ExerciseRecordsCompanion(
      id: id ?? this.id,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      workoutEntryId: workoutEntryId ?? this.workoutEntryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (workoutEntryId.present) {
      map['workout_entry_id'] = Variable<int>(workoutEntryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseRecordsCompanion(')
          ..write('id: $id, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('workoutEntryId: $workoutEntryId')
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

  final VerificationMeta _repsMeta = const VerificationMeta('reps');
  GeneratedIntColumn _reps;
  @override
  GeneratedIntColumn get reps => _reps ??= _constructReps();
  GeneratedIntColumn _constructReps() {
    return GeneratedIntColumn('reps', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedIntColumn _weight;
  @override
  GeneratedIntColumn get weight => _weight ??= _constructWeight();
  GeneratedIntColumn _constructWeight() {
    return GeneratedIntColumn('weight', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _workoutEntryIdMeta =
      const VerificationMeta('workoutEntryId');
  GeneratedIntColumn _workoutEntryId;
  @override
  GeneratedIntColumn get workoutEntryId =>
      _workoutEntryId ??= _constructWorkoutEntryId();
  GeneratedIntColumn _constructWorkoutEntryId() {
    return GeneratedIntColumn('workout_entry_id', $tableName, false,
        $customConstraints: 'REFERENCES workout_entries(id) ON DELETE CASCADE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, reps, weight, workoutEntryId];
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
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps'], _repsMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    }
    if (data.containsKey('workout_entry_id')) {
      context.handle(
          _workoutEntryIdMeta,
          workoutEntryId.isAcceptableOrUnknown(
              data['workout_entry_id'], _workoutEntryIdMeta));
    } else if (isInserting) {
      context.missing(_workoutEntryIdMeta);
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

class Exercise extends DataClass implements Insertable<Exercise> {
  final String name;
  final String muscle;
  final bool useBodyWeight;
  Exercise(
      {@required this.name,
      @required this.muscle,
      @required this.useBodyWeight});
  factory Exercise.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Exercise(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      muscle:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}muscle']),
      useBodyWeight: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}use_body_weight']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || muscle != null) {
      map['muscle'] = Variable<String>(muscle);
    }
    if (!nullToAbsent || useBodyWeight != null) {
      map['use_body_weight'] = Variable<bool>(useBodyWeight);
    }
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      muscle:
          muscle == null && nullToAbsent ? const Value.absent() : Value(muscle),
      useBodyWeight: useBodyWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(useBodyWeight),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Exercise(
      name: serializer.fromJson<String>(json['name']),
      muscle: serializer.fromJson<String>(json['muscle']),
      useBodyWeight: serializer.fromJson<bool>(json['useBodyWeight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'muscle': serializer.toJson<String>(muscle),
      'useBodyWeight': serializer.toJson<bool>(useBodyWeight),
    };
  }

  Exercise copyWith({String name, String muscle, bool useBodyWeight}) =>
      Exercise(
        name: name ?? this.name,
        muscle: muscle ?? this.muscle,
        useBodyWeight: useBodyWeight ?? this.useBodyWeight,
      );
  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('name: $name, ')
          ..write('muscle: $muscle, ')
          ..write('useBodyWeight: $useBodyWeight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(name.hashCode, $mrjc(muscle.hashCode, useBodyWeight.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.name == this.name &&
          other.muscle == this.muscle &&
          other.useBodyWeight == this.useBodyWeight);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<String> name;
  final Value<String> muscle;
  final Value<bool> useBodyWeight;
  const ExercisesCompanion({
    this.name = const Value.absent(),
    this.muscle = const Value.absent(),
    this.useBodyWeight = const Value.absent(),
  });
  ExercisesCompanion.insert({
    @required String name,
    @required String muscle,
    this.useBodyWeight = const Value.absent(),
  })  : name = Value(name),
        muscle = Value(muscle);
  static Insertable<Exercise> custom({
    Expression<String> name,
    Expression<String> muscle,
    Expression<bool> useBodyWeight,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (muscle != null) 'muscle': muscle,
      if (useBodyWeight != null) 'use_body_weight': useBodyWeight,
    });
  }

  ExercisesCompanion copyWith(
      {Value<String> name, Value<String> muscle, Value<bool> useBodyWeight}) {
    return ExercisesCompanion(
      name: name ?? this.name,
      muscle: muscle ?? this.muscle,
      useBodyWeight: useBodyWeight ?? this.useBodyWeight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (muscle.present) {
      map['muscle'] = Variable<String>(muscle.value);
    }
    if (useBodyWeight.present) {
      map['use_body_weight'] = Variable<bool>(useBodyWeight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('name: $name, ')
          ..write('muscle: $muscle, ')
          ..write('useBodyWeight: $useBodyWeight')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExercisesTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _muscleMeta = const VerificationMeta('muscle');
  GeneratedTextColumn _muscle;
  @override
  GeneratedTextColumn get muscle => _muscle ??= _constructMuscle();
  GeneratedTextColumn _constructMuscle() {
    return GeneratedTextColumn('muscle', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _useBodyWeightMeta =
      const VerificationMeta('useBodyWeight');
  GeneratedBoolColumn _useBodyWeight;
  @override
  GeneratedBoolColumn get useBodyWeight =>
      _useBodyWeight ??= _constructUseBodyWeight();
  GeneratedBoolColumn _constructUseBodyWeight() {
    return GeneratedBoolColumn('use_body_weight', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [name, muscle, useBodyWeight];
  @override
  $ExercisesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercises';
  @override
  final String actualTableName = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('muscle')) {
      context.handle(_muscleMeta,
          muscle.isAcceptableOrUnknown(data['muscle'], _muscleMeta));
    } else if (isInserting) {
      context.missing(_muscleMeta);
    }
    if (data.containsKey('use_body_weight')) {
      context.handle(
          _useBodyWeightMeta,
          useBodyWeight.isAcceptableOrUnknown(
              data['use_body_weight'], _useBodyWeightMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  Exercise map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Exercise.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(_db, alias);
  }
}

class WorkoutEntry extends DataClass implements Insertable<WorkoutEntry> {
  final int id;
  final DateTime date;
  final String exerciseName;
  WorkoutEntry(
      {@required this.id, @required this.date, @required this.exerciseName});
  factory WorkoutEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return WorkoutEntry(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      exerciseName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || exerciseName != null) {
      map['exercise_name'] = Variable<String>(exerciseName);
    }
    return map;
  }

  WorkoutEntriesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutEntriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      exerciseName: exerciseName == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseName),
    );
  }

  factory WorkoutEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WorkoutEntry(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      exerciseName: serializer.fromJson<String>(json['exerciseName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'exerciseName': serializer.toJson<String>(exerciseName),
    };
  }

  WorkoutEntry copyWith({int id, DateTime date, String exerciseName}) =>
      WorkoutEntry(
        id: id ?? this.id,
        date: date ?? this.date,
        exerciseName: exerciseName ?? this.exerciseName,
      );
  @override
  String toString() {
    return (StringBuffer('WorkoutEntry(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('exerciseName: $exerciseName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(date.hashCode, exerciseName.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WorkoutEntry &&
          other.id == this.id &&
          other.date == this.date &&
          other.exerciseName == this.exerciseName);
}

class WorkoutEntriesCompanion extends UpdateCompanion<WorkoutEntry> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> exerciseName;
  const WorkoutEntriesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.exerciseName = const Value.absent(),
  });
  WorkoutEntriesCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required String exerciseName,
  })  : date = Value(date),
        exerciseName = Value(exerciseName);
  static Insertable<WorkoutEntry> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<String> exerciseName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (exerciseName != null) 'exercise_name': exerciseName,
    });
  }

  WorkoutEntriesCompanion copyWith(
      {Value<int> id, Value<DateTime> date, Value<String> exerciseName}) {
    return WorkoutEntriesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      exerciseName: exerciseName ?? this.exerciseName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (exerciseName.present) {
      map['exercise_name'] = Variable<String>(exerciseName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutEntriesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('exerciseName: $exerciseName')
          ..write(')'))
        .toString();
  }
}

class $WorkoutEntriesTable extends WorkoutEntries
    with TableInfo<$WorkoutEntriesTable, WorkoutEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $WorkoutEntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _exerciseNameMeta =
      const VerificationMeta('exerciseName');
  GeneratedTextColumn _exerciseName;
  @override
  GeneratedTextColumn get exerciseName =>
      _exerciseName ??= _constructExerciseName();
  GeneratedTextColumn _constructExerciseName() {
    return GeneratedTextColumn('exercise_name', $tableName, false,
        $customConstraints: 'REFERENCES exercises(name) ON DELETE CASCADE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, date, exerciseName];
  @override
  $WorkoutEntriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'workout_entries';
  @override
  final String actualTableName = 'workout_entries';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('exercise_name')) {
      context.handle(
          _exerciseNameMeta,
          exerciseName.isAcceptableOrUnknown(
              data['exercise_name'], _exerciseNameMeta));
    } else if (isInserting) {
      context.missing(_exerciseNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WorkoutEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WorkoutEntriesTable createAlias(String alias) {
    return $WorkoutEntriesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ExerciseRecordsTable _exerciseRecords;
  $ExerciseRecordsTable get exerciseRecords =>
      _exerciseRecords ??= $ExerciseRecordsTable(this);
  $ExercisesTable _exercises;
  $ExercisesTable get exercises => _exercises ??= $ExercisesTable(this);
  $WorkoutEntriesTable _workoutEntries;
  $WorkoutEntriesTable get workoutEntries =>
      _workoutEntries ??= $WorkoutEntriesTable(this);
  ExerciseRecordsDao _exerciseRecordsDao;
  ExerciseRecordsDao get exerciseRecordsDao =>
      _exerciseRecordsDao ??= ExerciseRecordsDao(this as AppDatabase);
  ExercisesDao _exercisesDao;
  ExercisesDao get exercisesDao =>
      _exercisesDao ??= ExercisesDao(this as AppDatabase);
  WorkoutEntriesDao _workoutEntriesDao;
  WorkoutEntriesDao get workoutEntriesDao =>
      _workoutEntriesDao ??= WorkoutEntriesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [exerciseRecords, exercises, workoutEntries];
}
