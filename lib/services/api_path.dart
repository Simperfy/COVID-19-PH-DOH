class APIPath {
  // static apikey() => "20562BC7-5687-43F1-A7C1-1B61D5037508";
  static baseUrl() => "https://covid19-api-philippines.herokuapp.com";

  static getSummary() => '${baseUrl()}/api/summary';

  static getRegionSummary(String region) =>
      '${baseUrl()}/api/summary?region=$region';

  static getTopRegions() => '${baseUrl()}/api/top-regions';

  static getCasesTimeline({String region}) => region == null
      ? '${baseUrl()}/api/timeline'
      : '${baseUrl()}/api/timeline?region=$region';

  static getCasesTimelineRegion(String region) =>
      '${baseUrl()}/api/timeline?region=$region';

  static fetchRecord(int pageNumber, int limit) =>
      '${baseUrl()}/api/get?page=$pageNumber&limit=$limit';

  static fetchRecordByAge(int age) => '${baseUrl()}/api/filter/age/$age';

  static fetchRecordByAgeGroup(int minAge, int maxAge) =>
      '${baseUrl()}/api/filter/age_group/$minAge-$maxAge';

  static fetchRecordByMonth(int monthNumber) {
    String stringMonthNumber;
    if (monthNumber >= 9) {
      stringMonthNumber = '0$monthNumber';
    } else {
      stringMonthNumber = '$monthNumber';
    }

    return '${baseUrl()}/api/get?month=$stringMonthNumber';
  }

  static fetchRecordByRegion(String region) =>
      '${baseUrl()}/api/filter/region_res/$region';

  static fetchHospitalRecords() => '${baseUrl()}/api/facilities';
}
