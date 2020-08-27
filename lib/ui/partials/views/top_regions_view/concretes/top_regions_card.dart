import 'package:Covid19_PH/ui/partials/base/abstracts/abstract_home_view_card.dart';
import 'package:flutter/material.dart';

/// Contains Text and padding for the timeline card
class TopRegionsCard extends AbstractHomeViewCard {
  TopRegionsCard({
    @required Color bgColor,
    @required Widget child,
  }) : super(
          bgColor: bgColor,
          child: child,
        );
}
