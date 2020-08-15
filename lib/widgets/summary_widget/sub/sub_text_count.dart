import 'package:flutter/cupertino.dart';

class TextCountWidget extends StatelessWidget {
  final _count;
  final double _fontSize;
  TextCountWidget(this._count, this._fontSize);

  @override
  Widget build(BuildContext context) {
    return Text((_count != null ? _count.toString() : "..."),
              style: TextStyle(fontSize: _fontSize));
  }
}