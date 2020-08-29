import 'package:fitter/models/database.dart';
import 'package:fitter/widgets/screens/add_new_workout_record/components/exercise_choice_listview.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewWorkEntryScreen extends StatelessWidget {
  Widget _buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your exercise"),
      ),
      body: Consumer<List<Exercise>>(
        builder: (_, exercises, __) => ExerciseChoiceListView(exercises),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final exerciseDao = Provider.of<AppDatabase>(context).exercisesDao;

    return FutureProvider(
      create: (_) => exerciseDao.getAllExercises(),
      child: _buildContent(context),
      initialData: <Exercise>[],
    );
  }
}
