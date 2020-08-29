import 'package:fitter/models/table.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

class WorkoutRecordItemTile extends StatefulWidget {
  WorkoutRecordItemTile(this.record, this.index);
  final ExerciseRecord record;
  final int index;
  @override
  _WorkoutRecordItemTileState createState() => _WorkoutRecordItemTileState();
}

class _WorkoutRecordItemTileState extends State<WorkoutRecordItemTile> {
  TextEditingController weightTextController;
  TextEditingController repsTextContoller;

  @override
  void initState() {
    weightTextController = TextEditingController();
    repsTextContoller = TextEditingController();
    weightTextController.text = widget.record.weight.toString();
    repsTextContoller.text = widget.record.reps.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<AppDatabase>(context).exerciseRecordsDao;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text("${widget.index}"),
          Spacer(flex: 1),
          Flexible(
            child: TextField(
              controller: weightTextController,
              keyboardType: TextInputType.number,
            ),
            flex: 2,
          ),
          Spacer(flex: 1),
          Flexible(
            child: TextField(
              controller: repsTextContoller,
              keyboardType: TextInputType.number,
            ),
            flex: 2,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: () async {
                final newRecord = ExerciseRecordsCompanion(
                  id: Value(widget.record.id),
                  reps: Value(int.parse(repsTextContoller.text)),
                  weight: Value(int.parse(weightTextController.text)),
                  workoutEntryId: Value(widget.record.workoutEntryId),
                );
                await dao.updateEntry(newRecord);
              },
            ),
          )
        ],
      ),
    );
  }
}
