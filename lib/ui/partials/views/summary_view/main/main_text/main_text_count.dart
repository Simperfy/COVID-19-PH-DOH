import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MainTextCountWidget extends StatelessWidget {
  final int count;
  final double fontSize;
  MainTextCountWidget({@required this.count, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText((count != null ? count.toString() : "..."),
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold));
  }
}
