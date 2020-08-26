import 'package:Covid19_PH/model/hospital_summary.dart';
import 'package:Covid19_PH/services/hospital_database.dart';
import 'package:stacked/stacked.dart';

class FutureFacilitiesViewModel extends FutureViewModel<HospitalSummary> {
  static String hospitalNameQuery;

  static FutureFacilitiesViewModel _singleton =
      FutureFacilitiesViewModel._internal();
  factory FutureFacilitiesViewModel() => _singleton;
  FutureFacilitiesViewModel._internal();

  final _database = HospitalDatabase.instance;

  Future<HospitalSummary> _fetchFacilitiesData() async {
    var res = await _database.fetchHospitalRecordsSummary(
        hospitalName: hospitalNameQuery);

    return res;
  }

  String headerTitle = 'Summary of Philippine Hospital Facilities Number';
  HospitalSummary get hospitalSummary {
    return data;
  }

  @override
  Future<HospitalSummary> futureToRun() async => _fetchFacilitiesData();

  String checkFacilitiesCondition() {
    if (hospitalSummary == null) return null;
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

  double calculateOccupancyRate(int occupied, int vacant) {
    return (occupied == null || vacant == null)
        ? null
        : occupied / (vacant + occupied);
  }

  static setRegionQuery(String rq) {
    if (hospitalNameQuery != rq)
      _singleton = FutureFacilitiesViewModel._internal();
    hospitalNameQuery = rq;
  }
}
