import 'package:get/get.dart';

import '../constants/attributes_keys.dart';

class TranslationService extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'pt_BR': {
      AttributeKeys.corporate.volume : 'Volume Corporativo',
      AttributeKeys.corporate.contract : 'Contrato',
      AttributeKeys.corporate.sla : 'Prazo de entrega (SLA)',
      "account_manager" : 'Gerente',

      AttributeKeys.residential.color: 'Cor',
      AttributeKeys.residential.warranty: 'Garantia',
      AttributeKeys.residential.finish: 'Acabemento',

      AttributeKeys.industrial.industrialCapacity : 'Capacidade Industrial',
      AttributeKeys.industrial.certification : 'Certificação',
      AttributeKeys.industrial.voltage : 'Voltagem',
    }
  };

}

