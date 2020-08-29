import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/common/emoji_svg.dart';
import 'package:fitter/widgets/screens/exercises/components/exercise_tile.dart';
import 'package:flutter/material.dart';

class ExerciseListView extends StatelessWidget {
  ExerciseListView(this.exercises);

  final List<Exercise> exercises;
  @override
  Widget build(BuildContext context) {
    final delegate = exercises.length == 0
        ? SliverChildListDelegate.fixed([_buildEmptyList()])
        : SliverChildBuilderDelegate(
            (_, i) => ExerciseTile(exercises[i]),
            childCount: exercises.length,
          );
    return Container(
      child: SliverList(
        delegate: delegate,
      ),
    );
  }

  Widget _buildEmptyList() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: EmojiSvgs.getSvgByName('thinking', size: 100),
            ),
            Text(
              "Hmmm, no exerises found",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
