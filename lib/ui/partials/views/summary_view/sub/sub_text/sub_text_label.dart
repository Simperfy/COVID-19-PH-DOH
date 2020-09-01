import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SubTextLabelWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  SubTextLabelWidget({@required this.label, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AutoSizeText(label,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300)),
    );
  }
}
