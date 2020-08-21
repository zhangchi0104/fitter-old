import 'package:fitter/models/table.dart';
import 'components/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key key}) : super(key: key);
  static String get routeName => "/workout";

  Widget _buildScreen(BuildContext context) {
    return Center(
      child: Consumer<List<ExerciseRecord>>(
        builder: (_, data, __) => WorkoutItemListView(data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: db.exerciseRecordsDao.watchAllEntries(),
          initialData: <ExerciseRecord>[],
        )
      ],
      child: _buildScreen(context),
    );
  }
}
