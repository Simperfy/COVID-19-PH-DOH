import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel  {
  initialise() {
    print('Home View Model Initialized');
    notifyListeners();
  }
}