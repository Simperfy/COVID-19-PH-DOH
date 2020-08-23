import 'package:flutter/cupertino.dart';

class TextCountWidget extends StatelessWidget {
  final int count;
  final double fontSize;
  TextCountWidget({@required this.count, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text((count != null ? count.toString() : "..."),
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
    );
  }
}
