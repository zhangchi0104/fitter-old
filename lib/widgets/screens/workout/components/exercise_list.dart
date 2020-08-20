import 'package:fitter/widgets/screens/workout/components/exercise_tile.dart';
import 'package:flutter/material.dart';
import 'package:fitter/models/table.dart';

class ExerciseListView extends StatelessWidget {
  ExerciseListView(this.items);

  List<ExerciseRecord> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) {
        return ExerciseTile(items[i]);
      },
      itemCount: items.length,
    );
  }
}
