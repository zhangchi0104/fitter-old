import 'package:moor_flutter/moor_flutter.dart';
import './daos.dart';
part 'table.g.dart';

// child table
class ExerciseRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get reps => integer().withDefault(const Constant(0))();
  IntColumn get weight => integer().withDefault(const Constant(0))();

  IntColumn get workoutEntryId => integer()
      .customConstraint("REFERENCES workout_entries(id) ON DELETE CASCADE")();
}

@DataClassName("WorkoutEntry")
class WorkoutEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
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

@UseMoor(tables: [
  ExerciseRecords,
  Exercises,
  WorkoutEntries,
], daos: [
  ExerciseRecordsDao,
  ExercisesDao,
  WorkoutEntriesDao,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
              path: 'db.sqlite', logStatements: true),
        );

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) async {
          await migrator.createAll();
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onUpgrade: (migrator, from, _) async {
          if (from == 1) {
            await migrator.createAll();
          }
          if (from == 2) {
            await migrator.createAll();
          }
          return;
        },
      );
}
