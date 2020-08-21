import 'package:flutter/material.dart';

class BodyPartSelectionDialog extends StatefulWidget {
  const BodyPartSelectionDialog();

  @override
  _BodyPartSelectionDialogState createState() =>
      _BodyPartSelectionDialogState();
}

class _BodyPartSelectionDialogState extends State<BodyPartSelectionDialog> {
  final bodyParts = const [
    "None",
    "Core",
    "Arms",
    "Back",
    "Chest",
    "Legs",
    "Shoulders",
    "Other",
    "Olympic",
    "Full Body",
    "Cardio",
  ];
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Container(
          height: 400,
          width: 300,
          child: Stack(
            children: [
              _buildRadioButtons(context),
            ],
            alignment: Alignment.bottomRight,
          ),
        ),
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context, bodyParts[selectedIndex]);
          },
        ),
      ],
    );
  }

  Widget _buildRadioButtons(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => RadioListTile<String>(
        groupValue: bodyParts[selectedIndex],
        value: bodyParts[i],
        title: Text(bodyParts[i]),
        onChanged: (value) {
          this.setState(() {
            selectedIndex = i;
          });
        },
      ),
      itemCount: 10,
    );
  }
}
