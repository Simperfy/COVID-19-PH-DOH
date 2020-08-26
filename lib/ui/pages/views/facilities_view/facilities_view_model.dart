import 'package:Covid19_PH/model/hospital_summary.dart';
import 'package:Covid19_PH/services/hospital_database.dart';
import 'package:stacked/stacked.dart';

class FacilitiesViewModel extends FutureViewModel<HospitalSummary> {
  final _database = HospitalDatabase.instance;

  Future<HospitalSummary> fetchFacilitiesData() async =>
      await _database.fetchHospitalRecordsSummary();

  String headerTitle = 'Summary of Philippine Hospital Facilities Number';
  HospitalSummary get hospitalSummary {
    // print('hospital summary: $data');
    return data;
  }

  @override
  Future<HospitalSummary> futureToRun() async =>
      await runBusyFuture(fetchFacilitiesData());

  String checkFacilitiesCondition() {
    if (hospitalSummary.occupanyRate < .20) {
      return ' Great';
    } else if (hospitalSummary.occupanyRate < .50) {
      return ' Good';
    } else if (hospitalSummary.occupanyRate < .80) {
      return ' Average';
    } else {
      return ' Bad';
    }
  }

  double calculateOccupancyRate(int occupied, int vacant) =>
      occupied / (vacant + occupied);
}
