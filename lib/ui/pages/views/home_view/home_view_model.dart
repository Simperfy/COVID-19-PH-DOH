import 'package:Covid19_PH/services/hospital_database.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel  {
  initialise() {
    print('Home View Model Initialized');
    notifyListeners();

    _printHospital();
  }

  _printHospital() async{
    HospitalDatabase hospitalDatabase = HospitalDatabase.instance;
    print((await hospitalDatabase.fetchHospitalRecordsSummary(region: 'NATIONAL CAPITAL REGION (NCR)')).getData());
  }
}