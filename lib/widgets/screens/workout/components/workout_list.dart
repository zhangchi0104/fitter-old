import 'package:fitter/widgets/screens/workout/components/workout_tile.dart';
import 'package:flutter/material.dart';
import 'package:fitter/models/table.dart';

class WorkoutItemListView extends StatelessWidget {
  WorkoutItemListView(this.items);

  final List<ExerciseRecord> items;

  @override
  Widget build(BuildContext context) {
    return (items.length == 0)
        ? _buildStartButton(context)
        : _buildListView(context);
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) {
        return WorkoutItemTile(items[i]);
      },
      itemCount: items.length,
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {},
        child: Text("Start New Workout"),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
