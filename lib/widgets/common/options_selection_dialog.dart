import 'package:flutter/material.dart';

class OptionsSelectionDialog extends StatefulWidget {
  OptionsSelectionDialog(this.options);
  final List<String> options;
  @override
  _OptionsSelectionDialogState createState() => _OptionsSelectionDialogState();
}

class _OptionsSelectionDialogState extends State<OptionsSelectionDialog> {
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
            Navigator.pop(context, widget.options[selectedIndex]);
          },
        ),
      ],
    );
  }

  Widget _buildRadioButtons(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => RadioListTile<String>(
        groupValue: widget.options[selectedIndex],
        value: widget.options[i],
        title: Text(widget.options[i]),
        onChanged: (value) {
          this.setState(() {
            selectedIndex = i;
          });
        },
      ),
      itemCount: widget.options.length,
    );
  }
}
