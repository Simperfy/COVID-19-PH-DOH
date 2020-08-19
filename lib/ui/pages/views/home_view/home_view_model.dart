import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel  {
  initialise() {
    print('Home View Model Initialized');
    notifyListeners();
  }
}