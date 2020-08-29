import 'package:expandable/expandable.dart';
import 'package:fitter/models/daos.dart';
import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/common/tile.dart';
import 'package:fitter/widgets/screens/workout/components/workout_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutEntryTile extends StatefulWidget {
  WorkoutEntryTile(this.entry);

  final WorkoutEntry entry;

  @override
  _WorkoutEntryTileState createState() => _WorkoutEntryTileState();
}

class _WorkoutEntryTileState extends State<WorkoutEntryTile> {
  @override
  Widget build(BuildContext context) {
    final exercisesRecordsDao =
        Provider.of<AppDatabase>(context, listen: false).exerciseRecordsDao;
    return Tile(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ExpandablePanel(
        header: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.ac_unit, size: 38),
            SizedBox(width: 20),
            Text(widget.entry.exerciseName),
          ],
        ),
        expanded: Column(
          children: <Widget>[
            Row(
              children: [
                Spacer(flex: 2),
                Text("No."),
                Spacer(flex: 3),
                Text("Weight (kg)"),
                Spacer(flex: 5),
                Text("Reps"),
                //SizedBox(width: 10),
                Spacer(flex: 8),
              ],
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            buildRecordsTiles(exercisesRecordsDao),
            ButtonBar(
              children: [
                FlatButton(
                  child: Column(
                    children: [Icon(Icons.add), Text("Add set")],
                  ),
                  onPressed: () {
                    exercisesRecordsDao.insertNewEntries(
                        ExerciseRecordsCompanion.insert(
                            workoutEntryId: widget.entry.id));
                  },
                ),
              ],
              alignment: MainAxisAlignment.spaceAround,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecordsTiles(ExerciseRecordsDao dao) {
    return StreamProvider.value(
      value: dao.watchExerciseRecordsByWorkoutId(widget.entry.id),
      initialData: <ExerciseRecord>[],
      child: Consumer<List<ExerciseRecord>>(
        builder: (_, records, __) => WorkoutRecordListView(records),
      ),
    );
  }
}
