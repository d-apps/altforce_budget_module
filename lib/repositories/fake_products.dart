import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';

final fakeIndustrialProduct = IndustrialProduct(
    id: "tractor_1",
    name: "Trator JOHN DEERE 9RX 640",
    image: "https://i.imgur.com/AnQnyTT.png",
    price: 4500,
    type: 'IndustrialProduct',
    attributes: {}
);

final fakeResidentialProduct = ResidentialProduct(
    id: "irrigation_system_1",
    name: "Sistema de Irrigação Automática",
    image: "https://i.imgur.com/SejIMh1.png",
    price: 350,
    type: 'ResidentialProduct',
    attributes: {}
);

final fakeCorporateProduct = CorporateProduct(
    id: "drone_1",
    name: "Drone Agricola DJI AGRAS T40",
    image: "https://i.imgur.com/W1UhBGb.png",
    price: 152000,
    type: 'CorporateProduct',
    attributes: {
      "account_manager": "João Silva",
    }
);

