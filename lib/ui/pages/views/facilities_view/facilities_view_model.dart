import 'package:flutter/material.dart';

class FacilitiesViewModel extends ChangeNotifier {
  initialise() {
    print('Facilities View Model Initialized');
    notifyListeners();
  }
}