enum VoltageEnum {
  v200(200),
  v380(380);

  final int voltage;
  const VoltageEnum(this.voltage);

  @override
  String toString() => "${voltage}V";
}