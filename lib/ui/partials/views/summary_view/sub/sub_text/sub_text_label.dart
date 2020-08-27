import 'package:flutter/material.dart';

class SubTextLabelWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  SubTextLabelWidget({@required this.label, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300));
  }
}
