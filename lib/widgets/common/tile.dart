import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tile extends StatelessWidget {
  Tile(
      {Key key,
      this.height,
      this.width,
      @required this.child,
      this.padding = const EdgeInsets.all(5),
      this.margin = const EdgeInsets.all(5),
      this.borderRadius})
      : constraints = (width != null || height != null)
            ? BoxConstraints.tightFor(width: width, height: height)
            : BoxConstraints();

  double height;
  double width;
  BoxConstraints constraints;
  Widget child;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  double borderRadius;
  @override
  Widget build(BuildContext context) {
    print(borderRadius);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(this.borderRadius ?? 12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 4,
            color: Color.fromARGB(66, 137, 194, 233),
            offset: Offset(3, 3),
          ),
        ],
      ),
      constraints: constraints,
      child: child,
      margin: margin,
      padding: padding,
    );
  }
}
