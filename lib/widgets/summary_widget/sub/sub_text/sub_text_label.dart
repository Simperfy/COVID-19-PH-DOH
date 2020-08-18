import 'package:flutter/cupertino.dart';

class TextLabelWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  TextLabelWidget({@required this.label, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(label,
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300)),
    );
  }
}