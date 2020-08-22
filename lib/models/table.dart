import 'package:moor_flutter/moor_flutter.dart';

part 'table.g.dart';

// child table
class ExerciseRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get amountPerSet => integer().named('amount')();

  IntColumn get numSets => integer()();

  TextColumn get exerciseName =>
      text().customConstraint("REFERENCES exercises(name) ON DELETE CASCADE")();
}

// parent table
class Exercises extends Table {
  TextColumn get name => text().withLength(min: 1, max: 50)();

  TextColumn get muscle => text().withLength(min: 1, max: 20)();
  BoolColumn get useBodyWeight =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {name};
}

@UseMoor(
    tables: [ExerciseRecords, Exercises],
    daos: [ExerciseRecordsDao, ExercisesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
              path: 'db.sqlite', logStatements: true),
        );

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) async {
          await migrator.createTable(exercises);
          await migrator.createTable(exerciseRecords);
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onUpgrade: (migrator, from, to) {
          if (from == 1) {
            migrator.createTable(exercises);
          }
        },
      );
}

@UseDao(tables: [ExerciseRecords])
class ExerciseRecordsDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseRecordsDaoMixin {
  final AppDatabase db;
  ExerciseRecordsDao(this.db) : super(db);

  Stream<List<ExerciseRecord>> watchAllEntries() {
    return select(exerciseRecords).watch();
  }

  Future<int> insertNewEntries(ExerciseRecordsCompanion entry) {
    return into(exerciseRecords).insert(entry);
  }

  // WARNING: This function sould only be used for testing purpose
  Future resetDB() {
    return (delete(exerciseRecords)..where((t) => t.id.isBiggerOrEqualValue(0)))
        .go();
  }
}

@UseDao(tables: [Exercises])
class ExercisesDao extends DatabaseAccessor<AppDatabase>
    with _$ExercisesDaoMixin {
  final AppDatabase db;
  ExercisesDao(this.db) : super(db);

  Stream<List<Exercise>> watchAllExercises() {
    return select(exercises).watch();
  }

  Future<int> insert(String name, String bodyPart) {
    return into(exercises)
        .insert(ExercisesCompanion.insert(name: name, muscle: bodyPart));
  }
}
