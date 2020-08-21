import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/common/tile.dart';
import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  const ExerciseTile(this.record);

  final Exercise record;
  @override
  Widget build(BuildContext context) {
    return Tile(
      child: ListTile(
        leading: Icon(
          Icons.android,
          size: 40,
        ),
        title: Text(record.name),
        subtitle: Text(record.muscle),
      ),
    );
  }
}
