import 'package:fitter/models/database.dart';
import 'package:fitter/providers/add_new_exercise_view_model.dart';
import 'package:fitter/widgets/screens/add_new_exercise/components/dialogs.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class _AddNewExerciseScreen extends StatelessWidget {
  _AddNewExerciseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddNewExerciseScreenViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add New Exercise"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildTextField(context, viewModel),
              SizedBox(height: 3),
              _buildBodyPartSelectionButton(context, viewModel),
              _buildEquipmentSelectionButton(context, viewModel),
            ],
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(context, viewModel),
      ),
    );
  }

  Widget _buildFloatingActionButton(
      BuildContext context, AddNewExerciseScreenViewModel viewModel) {
    return FloatingActionButton(
      child: Icon(Icons.check),
      onPressed: () async {
        if (viewModel.exerciseName.isEmpty) {
          viewModel.isInputValid = false;
          return;
        }
        if (viewModel.exercise == null) {
          viewModel.insertCurrentState();
        } else {
          viewModel.updateOnCurrentState();
        }
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBodyPartSelectionButton(
      BuildContext context, AddNewExerciseScreenViewModel viewModel) {
    return ListTile(
      title: Text("Body Part"),
      trailing: Text(viewModel.bodyPart),
      onTap: () async {
        final res = await showDialog<String>(
          context: context,
          builder: (_) => BodyPartSelectionDialog(),
        );
        viewModel.bodyPart = res;
      },
    );
  }

  Widget _buildEquipmentSelectionButton(
      BuildContext context, AddNewExerciseScreenViewModel viewModel) {
    return ListTile(
      title: Text("Equipment"),
      trailing: Text(viewModel.equipment),
      onTap: () async {
        final res = await showDialog<String>(
          context: context,
          builder: (_) => EquipmentsSelectionDialog(),
        );
        viewModel.equipment = res;
      },
    );
  }

  Widget _buildTextField(
      BuildContext context, AddNewExerciseScreenViewModel viewModel) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Exercise Name",
        errorText: viewModel.isInputValid ? null : "Must Not be empty",
      ),
      maxLength: 50,
      controller: viewModel.controller,
    );
  }
}

class AddNewExerciseScreen extends StatelessWidget {
  // ignore: avoid_init_to_null
  const AddNewExerciseScreen({this.exercise = null});
  const AddNewExerciseScreen.update(this.exercise);

  final Exercise exercise;
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).exercisesDao;
    return exercise == null
        ? ChangeNotifierProvider(
            create: (_) => AddNewExerciseScreenViewModel(dao),
            builder: (_, __) => _AddNewExerciseScreen(),
          )
        : ChangeNotifierProvider(
            create: (_) => AddNewExerciseScreenViewModel.update(dao, exercise),
            child: _AddNewExerciseScreen(),
          );
  }
}
