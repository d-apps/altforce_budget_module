enum CorporateSlaEnum {
  support8x5("8x5"),
  support24x7("24x7"),
  supportVipWithParts("VIP com Peças");

  final String name;
  const CorporateSlaEnum(this.name);

  @override
  String toString()  => name;
}