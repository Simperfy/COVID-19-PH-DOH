class JsonBase {
  fromJson(Map<String, dynamic> map) {}

  getData() {}

  @override
  String toString();

  @override
  bool operator ==(Object o);

  @override
  int get hashCode;
}
