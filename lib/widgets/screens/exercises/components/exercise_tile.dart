import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/common/gym_equipments_icons.dart';
import 'package:fitter/widgets/common/tile.dart';
import 'package:fitter/widgets/screens/add_new_exercise/add_new_excises_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseTile extends StatelessWidget {
  const ExerciseTile(this.record);

  final Exercise record;
  @override
  Widget build(BuildContext context) {
    return Tile(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        leading: GymEquipmentsIcons.getSvgByName(record.equipment),
        title: Text(record.name),
        subtitle: Text(record.muscle),
        trailing: _buildTrailingButtons(context),
      ),
    );
  }

  Row _buildTrailingButtons(BuildContext context) {
    final exercisesDao = Provider.of<AppDatabase>(context).exercisesDao;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red[400],
          ),
          onPressed: () async {
            AwesomeDialog(
              context: context,
              btnOkColor: Colors.red[400],
              btnCancelColor: Colors.green[400],
              headerAnimationLoop: false,
              title: "warning",
              desc: "Are you sure deleting ${record.name}",
              btnOkOnPress: () => exercisesDao.removeExerciseByID(record.id),
              btnCancelOnPress: () {},
            )..show();
          },
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddNewExerciseScreen.update(record),
              ),
            );
          },
        ),
      ],
    );
  }
}
