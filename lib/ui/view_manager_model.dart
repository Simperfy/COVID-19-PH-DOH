import 'package:stacked/stacked.dart';

class ViewManagerModel extends IndexTrackingViewModel  {
  initialise() {
    print('Home View Model Initialized');
    notifyListeners();
  }
}