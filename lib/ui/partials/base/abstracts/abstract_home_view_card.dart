import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/widgets.dart';

abstract class AbstractHomeViewCard extends StatelessWidget {
  final Color bgColor;
  final Widget child;

  AbstractHomeViewCard({@required this.bgColor, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mainHeight * 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: bgColor),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: child,
    );
  }
}
