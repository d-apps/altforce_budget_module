enum ContractEnum {
  longTerm("Longo Prazo"),
  onDemand("Sobre Demanda");

  final String name;
  const ContractEnum(this.name);

  @override
  String toString() => name;
}