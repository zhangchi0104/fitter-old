import 'package:fitter/models/daos.dart';
import 'package:flutter/material.dart';

class ExercisePageViewModel with ChangeNotifier {
  ExercisePageViewModel(this._dao);

  ExercisesDao _dao;
  TextEditingController _controller;
  TextEditingController get controller => _controller;
  void init() {
    _controller = TextEditingController();
    _controller.addListener(() {
      print(controller.text);
      notifyListeners();
    });
  }

  dynamic watchEntries() {
    return _dao.watchExercisesByName(controller.text);
  }

  void onTextChange() {
    controller.notifyListeners();
  }
}
