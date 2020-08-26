import 'package:fitter/models/table.dart';
import 'package:fitter/providers/workout_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).workoutEntriesDao;
    final state = Provider.of<AppState>(context, listen: false);
    return IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () async {
        final firstEntry = await dao.getFirstEntry();
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: firstEntry.date,
          lastDate: DateTime(2100),
        );
        state.selectedWorkoutDate = date;
      },
    );
  }
}
