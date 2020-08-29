import 'package:fitter/models/table.dart';
import 'package:fitter/providers/exercise_page_view_model.dart';
import 'package:fitter/widgets/common/page_app_bar.dart';
import 'package:fitter/widgets/common/search_bar.dart';
import 'package:fitter/widgets/screens/exercises/components/add_new_exercise_button.dart';
import 'package:fitter/widgets/screens/exercises/components/exercise_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _ExercisesScreen extends StatelessWidget {
  _ExercisesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExercisePageViewModel>(context);
    return StreamProvider.value(
      value: model.watchEntries(),
      child: _buildListView(model),
      initialData: <Exercise>[],
    );
  }

  Widget _buildListView(ExercisePageViewModel model) {
    return Consumer<List<Exercise>>(
      builder: (_, data, __) {
        return CustomScrollView(
          slivers: [
            PageAppBar(
              title: "Exercises",
              actions: [AddNewExerciseButton()],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SearchBar(model.controller),
              ]),
            ),
            ExerciseListView(data),
          ],
        );
      },
    );
  }
}

class ExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exercisesDao = Provider.of<AppDatabase>(context).exercisesDao;
    return ChangeNotifierProvider(
      create: (_) => ExercisePageViewModel(exercisesDao)..init(),
      builder: (_, __) => _ExercisesScreen(),
    );
  }
}
