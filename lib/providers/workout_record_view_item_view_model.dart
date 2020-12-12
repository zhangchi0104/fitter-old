import 'package:fitter/models/database.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';

class WorkoutRecordTileViewModel {
  ExerciseRecordsDao _dao;
  ExerciseRecord _record;
  TextEditingController _weightController;
  TextEditingController _repsController;
  TextEditingController get weightController => _weightController;
  TextEditingController get repsController => _repsController;

  int get weight => int.parse(_weightController.text);
  int get reps => int.parse(_repsController.text);
  int get recordId => _record.id;
  WorkoutRecordTileViewModel(this._dao, this._record) {
    _weightController = TextEditingController();
    _repsController = TextEditingController();

    _weightController.text = _record.weight.toString();
    _repsController.text = _record.reps.toString();
  }

  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
  }

  void onDeletePressed() async {
    final res = await _dao.deleteRecordById(_record.id);
    print(res);
  }

  void onUpdatePressed() async {
    final newEntry = ExerciseRecordsCompanion.insert(
      id: Value(_record.id),
      reps: Value(reps),
      workoutEntryId: _record.workoutEntryId,
      weight: Value(weight),
    );
    print(newEntry);
    _dao.updateEntry(newEntry);
  }
}
