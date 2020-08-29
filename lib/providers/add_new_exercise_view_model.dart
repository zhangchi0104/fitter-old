import 'dart:async';

import 'package:fitter/models/database.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';

class AddNewExerciseScreenViewModel with ChangeNotifier {
  TextEditingController _controller;
  ExercisesDao _dao;
  String _bodyPart;
  String _equipment;
  Exercise _exercise;
  bool _isInputValid = true;

  TextEditingController get controller => _controller;
  String get bodyPart => _bodyPart;
  String get equipment => _equipment;
  String get exerciseName => _controller.text;
  bool get isInputValid => _isInputValid;
  Exercise get exercise => _exercise;
  
  set equipment(String equipment) {
    _equipment = equipment;
    notifyListeners();
  }

  set isInputValid(bool newVal) {
    _isInputValid = newVal;
    notifyListeners();
  }

  set bodyPart(String newVal) {
    _bodyPart = newVal;
    notifyListeners();
  }

  AddNewExerciseScreenViewModel(this._dao) {
    _bodyPart = "None";
    _equipment = "Body Weight";
    _exercise = null;
    _controller = TextEditingController();
  }

  AddNewExerciseScreenViewModel.update(this._dao, this._exercise) {
    _bodyPart = _exercise.muscle;
    _equipment = _exercise.equipment;
    _controller = TextEditingController();
    _controller.text = _exercise.name;
  }

  Future<int> insertCurrentState() {
    return _dao.insert(ExercisesCompanion.insert(
      name: controller.text,
      muscle: _bodyPart,
      equipment: _equipment,
    ));
  }

  Future<bool> updateOnCurrentState() {
    return _dao.updateExercise(ExercisesCompanion.insert(
      id: Value(_exercise.id),
      name: controller.text,
      muscle: _bodyPart,
      equipment: _equipment,
    ));
  }
}
