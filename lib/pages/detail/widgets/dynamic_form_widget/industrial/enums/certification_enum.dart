enum CertificationEnum {
  nr10("NR-10"),
  iso9001("ISO 9001");

  final String name;
  const CertificationEnum(this.name);

  @override
  String toString() => name;
}