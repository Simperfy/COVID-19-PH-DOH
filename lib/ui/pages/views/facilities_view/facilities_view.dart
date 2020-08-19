import 'package:Covid19_PH/ui/pages/views/facilities_view/facilities_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FacilitiesView extends StatelessWidget {
  static const routeName = '/facilities';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FacilitiesViewModel>.reactive(
      viewModelBuilder: () => FacilitiesViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              Text('Hospital1', style: TextStyle(fontSize: 30)),
              Text('Hospital2', style: TextStyle(fontSize: 30)),
              Text('Hospital3', style: TextStyle(fontSize: 30)),
              Text('Hospital4', style: TextStyle(fontSize: 30)),
              Text('Hospital5', style: TextStyle(fontSize: 30)),
            ],
          ),
        );
      },
    );
  }
}
