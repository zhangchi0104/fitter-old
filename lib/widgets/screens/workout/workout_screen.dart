import 'package:fitter/models/table.dart';
import 'package:moor_flutter/moor_flutter.dart';
import './components/exercise_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key key}) : super(key: key);
  static String get routeName => "/workout";
  @override
  Widget build(BuildContext context) {
    // final db = Provider.of<AppDatabase>(context);
    print("Building ${toString()}");
    // final data = Provider.of<List<ExerciseRecord>>(context);
    final db = Provider.of<AppDatabase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("workouts"),
      ),
      body: Center(
        child: Consumer<List<ExerciseRecord>>(
          builder: (_, data, __) => ExerciseListView(data),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final entry = ExerciseRecordsCompanion(
            amountPerSet: Value(10),
            name: Value("test"),
            numSets: Value(1),
          );
          db.insertNewEntries(entry);
        },
        tooltip: "add  ew exercise",
      ),
    );
  }
}
