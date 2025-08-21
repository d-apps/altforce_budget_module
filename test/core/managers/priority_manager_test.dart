import 'package:altforce_budget_module/core/managers/priority_manager.dart';
import 'package:altforce_budget_module/models/rules/i_business_rule.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks para a classe de regra de negócio para os testes
class MockBusinessRule extends Mock implements IBusinessRule {}

void main() {
  late PriorityManager sut;
  late MockBusinessRule rule1;
  late MockBusinessRule rule2;
  late MockBusinessRule rule3;

  setUp(() {
    sut = PriorityManager();
    rule1 = MockBusinessRule();
    rule2 = MockBusinessRule();
    rule3 = MockBusinessRule();
  });

  group('sortRules', () {
    test('should sort rules by priority in ascending order', () {
      // Configura as prioridades de cada regra
      when(() => rule1.priority).thenReturn(2); // Prioridade média
      when(() => rule2.priority).thenReturn(1); // Prioridade alta
      when(() => rule3.priority).thenReturn(3); // Prioridade baixa

      // Cria uma lista de regras fora de ordem
      final rules = [rule1, rule3, rule2];

      // Executa o método de ordenação
      final sortedRules = sut.sortRules(rules);

      // A lista deve ser ordenada por prioridade (1, 2, 3)
      expect(sortedRules, [rule2, rule1, rule3]);
    });

    test('should not change the order if rules already sorted', () {
      // Configura as regras para que já estejam ordenadas
      when(() => rule1.priority).thenReturn(1);
      when(() => rule2.priority).thenReturn(2);
      when(() => rule3.priority).thenReturn(3);

      final rules = [rule1, rule2, rule3];

      final sortedRules = sut.sortRules(rules);

      expect(sortedRules, [rule1, rule2, rule3]);
    });

    test('should handle empty list without throwing an exception', () {
      final rules = <IBusinessRule>[];
      final sortedRules = sut.sortRules(rules);
      expect(sortedRules, isEmpty);
    });
  });
}
