import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/widgets.dart';

abstract class AbstractHomeViewCard extends StatelessWidget {
  final Color bgColor;
  final Widget child;

  AbstractHomeViewCard({@required this.bgColor, @required this.child});

  @override
  Widget build(BuildContext context) {
    final double horizontalCardPadding = SizeConfig.getCardsPadding;
    return Container(
      height: SizeConfig.getCardsHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: bgColor),
      padding: EdgeInsets.symmetric(horizontal: horizontalCardPadding, vertical: 10),
      child: child,
    );
  }
}
