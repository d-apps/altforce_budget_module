enum CorporateContractEnum {
  longTerm("Longo Prazo"),
  onDemand("Sobre Demanda");

  final String name;
  const CorporateContractEnum(this.name);

  @override
  String toString() => name;
}