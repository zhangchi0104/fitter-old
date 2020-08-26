import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

typedef S ItemCreator<S>();

class ViewMap {
  ViewMap({
    @required this.title,
    @required this.builder,
    @required this.icon,
    this.actionButton,
    this.color,
  });
  String title;
  Widget Function() builder;
  IconData icon;
  Widget actionButton;
  MaterialColor color;
}
