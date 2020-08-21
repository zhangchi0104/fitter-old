import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/screens/exercises/components/exercise_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExercisesScreen extends StatefulWidget {
  static String get routeName => '/exercises';
  ExercisesScreen({Key key}) : super(key: key);

  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return StreamProvider.value(
      value: db.exercisesDao.watchAllExercises(),
      child: _buildListView(context),
      initialData: <Exercise>[],
    );
  }

  Widget _buildListView(BuildContext context) {
    return Consumer<List<Exercise>>(
      builder: (_, data, __) {
        return ExerciseListView(data);
      },
    );
  }
}
