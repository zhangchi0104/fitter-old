import 'package:moor_flutter/moor_flutter.dart';

part 'table.g.dart';

class ExerciseRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get amountPerSet => integer().named('amount')();

  IntColumn get numSets => integer()();

  TextColumn get name => text().withLength(min: 1, max: 30)();
}

@UseMoor(tables: [ExerciseRecords])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<ExerciseRecord>> getAllEntries() {
    return select(exerciseRecords).get();
  }

  Stream<List<ExerciseRecord>> watchAllEntries() {
    return select(exerciseRecords).watch();
  }

  Future<int> insertNewEntries(ExerciseRecordsCompanion entry) {
    return into(exerciseRecords).insert(entry);
  }

  Future resetDB() {
    return (delete(exerciseRecords)..where((t) => t.id.isBiggerOrEqualValue(0)))
        .go();
  }
}
