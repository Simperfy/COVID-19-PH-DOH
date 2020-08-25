import 'package:Covid19_PH/model/hospital_summary.dart';
import 'package:Covid19_PH/services/hospital_database.dart';
import 'package:stacked/stacked.dart';

class FacilitiesSummaryViewModel extends FutureViewModel<HospitalSummary> {
  static String query;
  static final FacilitiesSummaryViewModel _singleton = FacilitiesSummaryViewModel._internal();
  factory FacilitiesSummaryViewModel() => _singleton;
  FacilitiesSummaryViewModel._internal();

  @override
  Future<HospitalSummary> futureToRun() {
    print('FIRING FACILITIES VIEW MODEL');
    return _getFacilitiesSummary();
  }

  Future<HospitalSummary> _getFacilitiesSummary() async {
    final HospitalDatabase database = HospitalDatabase.instance;
    print('the query: $query');
    return (await database.fetchHospitalRecordsSummary(region: query)).getData();
  }
}
