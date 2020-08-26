import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/common/tile.dart';
import 'package:flutter/material.dart';

class ExerciseChoice extends StatelessWidget {
  final Exercise exercise;
  ExerciseChoice(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Tile(
      child: ListTile(
        leading: Icon(
          Icons.menu,
          size: 40,
        ),
        title: Text(exercise.name),
        subtitle: Text(exercise.muscle),
        onTap: () => Navigator.pop(context, exercise.name),
      ),
    );
  }
}
