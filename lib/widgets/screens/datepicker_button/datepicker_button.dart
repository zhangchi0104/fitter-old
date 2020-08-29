import 'package:fitter/models/table.dart';
import 'package:fitter/providers/workout_state.dart';
import 'package:fitter/widgets/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).workoutEntriesDao;
    final state = Provider.of<AppState>(context, listen: false);
    return IconButton(
      icon: Icon(
        Icons.calendar_today,
        color: Colors.orange[400],
      ),
      onPressed: () async {
        final firstEntry = await dao.getFirstEntry();
        final dateToday = getDateToday();
        final beginDate = firstEntry?.first?.date ?? dateToday;
        final date = await showDatePicker(
          context: context,
          initialDate: dateToday,
          firstDate: beginDate,
          lastDate: DateTime(2100),
        );
        state.selectedWorkoutDate = date ?? dateToday;
      },
    );
  }
}
