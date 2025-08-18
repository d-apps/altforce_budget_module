abstract class AttributeKeys {
  static final Corporate corporate = Corporate();
  static final Residential residential = Residential();
  static final Industrial industrial = Industrial();
}

class Corporate {
  final String volume = 'corporate_volume';
  final String contract = 'contract';
  final String sla = 'sla';
}

class Residential {
  final String color = 'color';
  final String warranty = 'warranty';
  final String finish = 'finish';
}

class Industrial {
  final String voltage = 'voltage';
  final String certification = 'certification';
  final String industrialCapacity = 'industrial_capacity';
}


