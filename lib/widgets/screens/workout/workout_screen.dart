import 'package:fitter/models/table.dart';
import 'package:fitter/providers/workout_state.dart';
import 'package:fitter/widgets/common/page_app_bar.dart';
import 'package:fitter/widgets/screens/datepicker_button/datepicker_button.dart';
import 'components/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key key}) : super(key: key);
  static String get routeName => "/workout";

  Widget _buildScreen(BuildContext context) {
    return Consumer<List<WorkoutEntry>>(
      builder: (_, data, __) {
        return CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            PageAppBar(
              title: "Workouts",
              actions: [DatePickerButton()],
            ),
            WorkoutItemListView(data),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context, listen: false);
    final state = Provider.of<AppState>(context);
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: db.workoutEntriesDao
              .watchEntriesByDate(state.selectedWorkoutDate),
          initialData: <WorkoutEntry>[],
        )
      ],
      child: _buildScreen(context),
    );
  }
}
