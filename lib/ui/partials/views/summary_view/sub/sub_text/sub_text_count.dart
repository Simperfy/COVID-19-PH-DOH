import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SubTextCountWidget extends StatelessWidget {
  final int count;
  final double fontSize;
  SubTextCountWidget({@required this.count, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AutoSizeText((count != null ? count.toString() : "..."),
          style: TextStyle(fontSize: fontSize),
          overflow: TextOverflow.ellipsis),
    );
  }
}
