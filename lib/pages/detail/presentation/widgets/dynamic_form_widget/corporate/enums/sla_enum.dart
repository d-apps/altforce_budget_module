enum SlaEnum {
  sla3(3),
  sla7(7);

  final int days;
  const SlaEnum(this.days);

  @override
  String toString()  => "$days dias";
}