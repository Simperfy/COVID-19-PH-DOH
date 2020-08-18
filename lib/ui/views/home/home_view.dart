import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/widgets/timeline_widget/timeline_widget.dart';
import 'package:Covid19_PH/widgets/summary_widget/summary_widget.dart';
import 'package:Covid19_PH/widgets/top_regions_widget/top_regions_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 30.0),
          SummaryWidget(),
          SizedBox(height: 30.0),
          TimelineWidget(),
          SizedBox(height: 30.0),
          TopRegionsWidget(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
