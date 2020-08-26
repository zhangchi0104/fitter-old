import 'package:fitter/widgets/screens/workout/components/workout_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:fitter/models/table.dart';

class WorkoutRecordListView extends StatelessWidget {
  WorkoutRecordListView(this.records);
  final List<ExerciseRecord> records;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          records.mapIndex((e, i) => WorkoutRecordItemTile(e, i + 1)).toList(),
    );
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndex<T>(T f(E e, int i)) {
    var i = 0;
    return this.map((e) => f(e, i++));
  }

  void forEachIndex(void f(E e, int i)) {
    var i = 0;
    this.forEach((e) => f(e, i++));
  }
}
