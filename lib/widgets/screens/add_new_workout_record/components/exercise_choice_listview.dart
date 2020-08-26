import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/screens/add_new_workout_record/components/exercise_choice.dart';
import 'package:flutter/material.dart';

class ExerciseChoiceListView extends StatelessWidget {
  const ExerciseChoiceListView(this.exercises, {Key key}) : super(key: key);
  final List<Exercise> exercises;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (_, i) => ExerciseChoice(exercises[i]),
        itemCount: exercises.length,
      ),
    );
  }
}
