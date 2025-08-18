// acabamento
enum FinishEnum {
  matte("Fosco"),
  glossy("Brilhante");

  final String name;
  const FinishEnum(this.name);

  @override
  String toString() => name;
}