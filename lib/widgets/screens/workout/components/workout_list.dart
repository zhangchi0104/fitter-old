import 'package:fitter/widgets/screens/add_new_workout_record/add_new_workout_record.dart';
import 'package:fitter/widgets/screens/workout/components/workout_tile.dart';
import 'package:flutter/material.dart';
import 'package:fitter/models/table.dart';
import 'package:provider/provider.dart';

class WorkoutItemListView extends StatelessWidget {
  WorkoutItemListView(this.items);

  final List<WorkoutEntry> items;

  @override
  Widget build(BuildContext context) {
    //print(items);
    return _buildListView(context);
  }

  Widget _buildListView(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, i) {
          return i < items.length
              ? WorkoutEntryTile(items[i])
              : _buildAddExerciseButton(context);
        },
        childCount: items.length + 1,
      ),
    );
  }

  Widget _buildAddExerciseButton(BuildContext context) {
    final workoutEntryDao = Provider.of<AppDatabase>(context).workoutEntriesDao;
    return Flex(
      direction: Axis.vertical,
      children: [
        FlatButton(
          onPressed: () async {
            final exerciseName = await Navigator.push(
              context,
              MaterialPageRoute<String>(
                builder: (_) => AddNewWorkEntryScreen(),
              ),
            );
            final newEntry = WorkoutEntriesCompanion.insert(
                date: getDateToday(), exerciseName: exerciseName);
            workoutEntryDao.insertEntry(newEntry);
          },
          child: Text(
            "Add an exercise",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  DateTime getDateToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
