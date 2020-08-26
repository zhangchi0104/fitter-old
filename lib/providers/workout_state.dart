import 'package:fitter/widgets/common/utils.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  DateTime _selectedWorkoutDate = getDateToday();
  DateTime get selectedWorkoutDate => this._selectedWorkoutDate;
  set selectedWorkoutDate(DateTime newDate) {
    _selectedWorkoutDate = newDate;
    notifyListeners();
  }
}
