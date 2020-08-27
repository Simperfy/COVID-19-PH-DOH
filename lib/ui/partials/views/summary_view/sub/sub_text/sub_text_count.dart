import 'package:flutter/material.dart';

class SubTextCountWidget extends StatelessWidget {
  final int count;
  final double fontSize;
  SubTextCountWidget({@required this.count, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text((count != null ? count.toString() : "..."),
        style: TextStyle(fontSize: fontSize));
  }
}
