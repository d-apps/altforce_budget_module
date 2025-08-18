enum IndustrialCapacityEnum {
  kg200("200 kg/h"),
  kg500("500 kg/h"),
  kg1000("1000 kg/h"),
  ton2("2 ton/h");

  final String name;
  const IndustrialCapacityEnum(this.name);

  @override
  String toString() => name;
}