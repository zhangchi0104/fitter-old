import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
    this.controller, {
    Key key,
    this.padding = const EdgeInsets.all(8),
  });
  final TextEditingController controller;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          labelText: "Search exercise here",
          fillColor: Colors.grey[300],
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
      ),
    );
  }
}
