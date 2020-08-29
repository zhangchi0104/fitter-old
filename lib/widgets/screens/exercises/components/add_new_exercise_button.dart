import '../../add_new_exercise/add_new_excises_screen.dart';
import 'package:flutter/material.dart';

class AddNewExerciseButton extends StatelessWidget {
  const AddNewExerciseButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.add,
        color: Colors.blue,
      ),
      onPressed: () {
        final pageRoute = MaterialPageRoute(
          builder: (_) => AddNewExerciseScreen(),
        );
        Navigator.of(context).push(pageRoute);
      },
    );
  }
}
