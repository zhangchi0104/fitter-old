import 'package:fitter/models/daos.dart';
import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/screens/add_new_exercise/components/body_part_selectIon_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewExerciseScreen extends StatefulWidget {
  AddNewExerciseScreen({Key key}) : super(key: key);

  @override
  _AddNewExerciseScreenState createState() => _AddNewExerciseScreenState();
}

class _AddNewExerciseScreenState extends State<AddNewExerciseScreen> {
  TextEditingController textEditingController;
  String selectedBodyPart = "None";
  bool useBodyWeight = false;
  bool validateInput = true;
  @override
  void initState() {
    textEditingController = TextEditingController();

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
    return Scaffold(
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
            CheckboxListTile(
              value: useBodyWeight,
              title: Text("Uses Body Weight?"),
              onChanged: (val) => setState(() {
                useBodyWeight = val;
              }),
            )
          ],
        ),
      ),
      floatingActionButton: Consumer<ExercisesDao>(
          builder: (ctx, dao, _) => _buildFloatingActionButton(ctx, dao)),
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
        await exercisesDao.insert(
          textEditingController.text,
          selectedBodyPart,
        );
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
