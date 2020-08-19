import 'package:flutter/cupertino.dart';

class MainTextLabel extends StatelessWidget {
  final String label;
  final double fontSize;
  MainTextLabel({@required this.label, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300));
  }
}
