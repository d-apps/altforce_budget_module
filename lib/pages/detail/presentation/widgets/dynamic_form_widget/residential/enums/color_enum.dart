// acabamento
enum ColorEnum {
  green("Verde"),
  yellow("Amarelo");

  final String name;
  const ColorEnum(this.name);

  @override
  String toString() => name;
}