import 'package:fitter/widgets/common/options_selection_dialog.dart';
import 'package:flutter/material.dart';

class BodyPartSelectionDialog extends StatelessWidget {
  const BodyPartSelectionDialog({Key key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return OptionsSelectionDialog(bodyParts);
  }
}

class EquipmentsSelectionDialog extends StatelessWidget {
  const EquipmentsSelectionDialog({Key key}) : super(key: key);

  final equipments = const [
    "Body Weights",
    "Barbell",
    "Kettlebell",
    "Dumbell",
    "TRX",
    "Machine",
  ];
  @override
  Widget build(BuildContext context) {
    return OptionsSelectionDialog(equipments);
  }
}
