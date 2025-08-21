import 'package:altforce_budget_module/core/extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("DoubleExtension", () {
    test("should format a double into a Brazilian currency string with two decimal places", () {
      const double value = 1234.56;
      final formattedString = value.formatCurrency();
      expect(formattedString, 'R\$ 1.234,56');
    });

    test("should format a double with no decimals correctly", () {
      const double value = 100.00;
      final formattedString = value.formatCurrency();
      expect(formattedString, 'R\$ 100,00');
    });

    test("should format a double with a single decimal place correctly", () {
      const double value = 99.9;
      final formattedString = value.formatCurrency();
      expect(formattedString, 'R\$ 99,90');
    });

    test("should format a large double value with correct thousands separators", () {
      const double value = 1234567.89;
      final formattedString = value.formatCurrency();
      expect(formattedString, 'R\$ 1.234.567,89');
    });

    test("should handle a zero value correctly", () {
      const double value = 0.0;
      final formattedString = value.formatCurrency();
      expect(formattedString, 'R\$ 0,00');
    });

    test("should handle a negative value correctly", () {
      const double value = -50.0;
      final formattedString = value.formatCurrency();
      expect(formattedString, 'R\$ -50,00');
    });
  });
}
