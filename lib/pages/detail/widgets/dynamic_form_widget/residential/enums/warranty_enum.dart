// acabamento
enum WarrantyEnum {
  month6("6 meses"),
  month12("12 meses");

  final String name;
  const WarrantyEnum(this.name);

  @override
  String toString() => name;
}