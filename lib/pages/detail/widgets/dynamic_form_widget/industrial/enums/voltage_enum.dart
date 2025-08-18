enum VoltageEnum {
  v200("200V"),
  v380("380V");

  final String name;
  const VoltageEnum(this.name);

  @override
  String toString() => name;
}