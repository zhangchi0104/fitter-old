import "package:moor_flutter/moor_flutter.dart";
import './table.dart';

part 'daos.g.dart';

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

  Future<bool> updateEntry(Insertable<ExerciseRecord> newRecord) {
    return update(exerciseRecords).replace(newRecord);
  }

  Stream<List<ExerciseRecord>> watchExerciseRecordsByWorkoutId(int workoutId) {
    return (select(exerciseRecords)
          ..where((record) => record.workoutEntryId.equals(workoutId)))
        .watch();
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

  Stream<List<Exercise>> watchExercisesByName(String name) {
    print("Dao: watch on keyword $name");
    if (name == null || name.isEmpty) {
      return watchAllExercises();
    }
    return (select(exercises)..where((e) => e.name.contains(name))).watch();
  }

  Future<int> insert(Insertable<Exercise> exercise) {
    return into(exercises).insert(exercise);
  }

  Future<List<Exercise>> getAllExercises() {
    return select(exercises).get();
  }

  Future<bool> updateExercise(Insertable<Exercise> exercise) {
    return update(exercises).replace(exercise);
  }

  Future<int> removeExerciseByID(int id) {
    return (delete(exercises)..where((e) => e.id.equals(id))).go();
  }
}

@UseDao(tables: [WorkoutEntries])
class WorkoutEntriesDao extends DatabaseAccessor<AppDatabase>
    with _$WorkoutEntriesDaoMixin {
  final AppDatabase db;

  WorkoutEntriesDao(this.db) : super(db);

  Stream<List<WorkoutEntry>> watchEntriesByDate(DateTime date) {
    return (select(workoutEntries)..where((entry) => entry.date.equals(date)))
        .watch();
  }

  Future<int> insertEntry(Insertable<WorkoutEntry> newEntry) {
    return into(workoutEntries).insert(newEntry);
  }

  Future<List<WorkoutEntry>> getAllEntries() {
    return (select(workoutEntries)).get();
  }
}
