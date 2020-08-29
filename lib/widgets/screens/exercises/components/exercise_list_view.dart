import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/screens/exercises/components/exercise_tile.dart';
import 'package:flutter/material.dart';

class ExerciseListView extends StatelessWidget {
  ExerciseListView(this.exercises);

  final List<Exercise> exercises;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
           (_, i) => ExerciseTile(exercises[i]),
          childCount: exercises.length,
        ),
      ),
    );
  }
}
