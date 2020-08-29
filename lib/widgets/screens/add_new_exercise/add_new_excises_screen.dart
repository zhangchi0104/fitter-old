import 'package:fitter/models/database.dart';
import 'package:fitter/widgets/screens/add_new_exercise/components/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddNewExerciseScreen extends StatefulWidget {
  AddNewExerciseScreen({Key key}) : super(key: key);
  AddNewExerciseScreen.update(this.exercise);
  Exercise exercise;
  @override
  _AddNewExerciseScreenState createState() => _AddNewExerciseScreenState();
}

class _AddNewExerciseScreenState extends State<AddNewExerciseScreen> {
  TextEditingController textEditingController;
  String selectedBodyPart = "None";
  String selectedEquipment = "Body weight";
  bool validateInput = true;
  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.text = widget.exercise?.name ?? "";
    this.selectedBodyPart = widget.exercise?.muscle ?? "None";
    this.selectedEquipment = widget.exercise?.equipment ?? "Body Weight";
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return Provider.value(
      value: db.exercisesDao,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add New Exercise"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildTextField(context),
              SizedBox(height: 3),
              _buildBodyPartSelectionButton(context),
              _buildEquipmentSelectionButton(context),
            ],
          ),
        ),
        floatingActionButton: Consumer<ExercisesDao>(
            builder: (ctx, dao, _) => _buildFloatingActionButton(ctx, dao)),
      ),
    );
  }

  Widget _buildFloatingActionButton(
      BuildContext context, ExercisesDao exercisesDao) {
    return FloatingActionButton(
      child: Icon(Icons.check),
      onPressed: () async {
        if (textEditingController.text.isEmpty) {
          this.setState(() {
            validateInput = false;
            return;
          });
        }
        if (widget.exercise == null) {
          await exercisesDao.insert(ExercisesCompanion.insert(
            name: textEditingController.text,
            muscle: this.selectedBodyPart,
            equipment: this.selectedEquipment,
          ));
        } else {
          final updatedExercise = ExercisesCompanion.insert(
            id: Value(widget.exercise.id),
            name: textEditingController.text,
            muscle: selectedBodyPart,
            equipment: selectedEquipment,
          );
          await exercisesDao.updateExercise(updatedExercise);
        }
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBodyPartSelectionButton(BuildContext context) {
    return ListTile(
      title: Text("Body Part"),
      trailing: Text(selectedBodyPart),
      onTap: () async {
        final res = await showDialog<String>(
          context: context,
          builder: (_) => BodyPartSelectionDialog(),
        );
        setState(() {
          this.selectedBodyPart = res;
        });
      },
    );
  }

  Widget _buildEquipmentSelectionButton(BuildContext context) {
    return ListTile(
      title: Text("Equipment"),
      trailing: Text(selectedEquipment),
      onTap: () async {
        final res = await showDialog<String>(
          context: context,
          builder: (_) => EquipmentsSelectionDialog(),
        );
        setState(() {
          this.selectedEquipment = res;
        });
      },
    );
  }

  Widget _buildTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Exercise Name",
        errorText: validateInput ? null : "Must Not be empty",
      ),
      maxLength: 50,
      controller: textEditingController,
    );
  }
}
