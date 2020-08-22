import 'package:Covid19_PH/ui/partials/base/abstracts/abstract_home_view_card.dart';
import 'package:flutter/material.dart';

class FacilitiesCard extends AbstractHomeViewCard {
  FacilitiesCard({
    @required Color bgColor,
    @required Widget child,
  }) : super(
          bgColor: bgColor,
          child: child,
        );
}