import 'package:money2/money2.dart';

extension DoubleExtension on double {

  String formatCurrency() {
    final value = Money.fromNum(this, isoCode: 'BRL');
    return value.toString();
  }

}