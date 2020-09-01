import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  static final HomeViewModel _singleton = HomeViewModel._internal();
  factory HomeViewModel() => _singleton;
  HomeViewModel._internal();

  // SummaryView summaryCard;
  // TimelineView timelineCard;
  // TopRegionsView topRegionsCard;
  // FacilitiesSummaryView facilitiesSummaryCard;

  initialise() {}

  List<Widget> addCard(int id, Widget card) {
    List<Widget> res = [];
    // switch (id) {
    //   case 1:
    //     // if (summaryCard != null) print('NULL NOT TRIGGERED');
    //     if (summaryCard == null) summaryCard = card;
    //     res.add(summaryCard);
    //     break;

    //   case 2:
    //     // if (timelineCard != null) print('NULL NOT TRIGGERED');
    //     if (timelineCard == null) timelineCard = card;
    //     res.add(timelineCard);
    //     break;

    //   case 3:
    //     // if (topRegionsCard != null) print('NULL NOT TRIGGERED');
    //     if (topRegionsCard == null) topRegionsCard = card;
    //     res.add(topRegionsCard);
    //     break;

    //   case 4:
    //     // if (facilitiesSummaryCard != null) print('NULL NOT TRIGGERED');
    //     if (facilitiesSummaryCard == null) facilitiesSummaryCard = card;
    //     res.add(facilitiesSummaryCard);
    //     break;

    //   default:
    //     throw ('Cannot find card in home_view_model.dart');
    // }

    res.add(card);
    res.add(SizedBox(height: 30));
    return res;
  }
}
