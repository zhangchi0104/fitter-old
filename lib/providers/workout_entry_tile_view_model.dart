import 'package:fitter/models/daos.dart.old';
import 'package:fitter/models/database.dart';
import 'package:flutter/material.dart';

class WorkoutEntryTileViewModel with ChangeNotifier {
  WorkoutEntryTileViewModel(this._exercise, this._dao);

  WorkoutEntryWithExercise _exercise;
  ExerciseRecordsDao _dao;

  String get equipment => _exercise.exercise.equipment;
  String get exerciseName => _exercise.entry.exerciseName;
  int get workoutId => _exercise.entry.id;

  Stream<List<ExerciseRecord>> watchExerciseRecords() {
    return _dao.watchExerciseRecordsByWorkoutId(_exercise.entry.id);
  }

  Future<int> insertCurrentState() {
    return _dao.insertNewEntries(
      ExerciseRecordsCompanion.insert(workoutEntryId: workoutId),
    );
  }
}
