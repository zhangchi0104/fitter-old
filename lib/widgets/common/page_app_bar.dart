import 'dart:io';

import 'package:flutter/material.dart';

class PageAppBar extends StatelessWidget {
  PageAppBar({
    Key key,
    @required this.title,
    @required this.actions,
  }) : super(key: key);
  final String title;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 110,
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        //
        centerTitle: true,
        titlePadding:
            Platform.isAndroid ? EdgeInsets.only(left: 20, bottom: 16) : null,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
