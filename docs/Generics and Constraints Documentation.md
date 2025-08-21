# Visão Geral

Nossa arquitetura utiliza genéricos e constraints para construir um sistema modular, reutilizável e robusto. Em vez de escrever código específico para cada tipo de dado, criamos componentes genéricos que funcionam com qualquer classe, desde que ela atenda a um conjunto de regras (as constraints).

Isso nos permite:

Reutilizar Código: Um único Repository pode ser usado para diferentes entidades (Product, User, etc.).

Reforçar Regras: O compilador nos ajuda a garantir que os objetos passados para uma função possuem a funcionalidade necessária.

Simplificar Testes: É mais fácil testar um componente isolado, como o PriorityManager, que não se importa com a entidade, mas sim com a sua capacidade de ser ordenada.

### Genéricos em Ação: O Repositório

Interface Genérica: O IRepository<T> define um contrato para qualquer tipo de dado.
T aqui é um placeholder para a entidade com a qual o repositório irá trabalhar.

Implementação Concreta: O ProductsController injeta uma implementação de IRepository<Product>. Isso significa que, nesse caso, o T foi substituído pela classe Product, e o repositório só vai lidar com objetos do tipo Product.

A beleza disso é que se você precisar de um repositório para outra entidade, por exemplo, um UsersRepository, você só precisa criar a classe que implementa IRepository<User>, mantendo a mesma estrutura e lógica.

Constraints na Lógica de Negócio
As constraints (restrições) são usadas para garantir que o genérico T atenda a um contrato específico. No seu projeto, isso é visível no PriorityManager.

###  A Interface IBusinessRule:

Esta interface atua como uma constraint. Ela garante que qualquer classe que a implemente terá um atributo priority e o método compareTo.

###  O PriorityManager:

```dart
List<IBusinessRule> sortRules(List<IBusinessRule> rules) {
rules.sort((a, b) => a.priority.compareTo(b.priority));
return rules;
}
```

O método sortRules pode receber qualquer lista de objetos, desde que cada objeto seja um IBusinessRule. Essa restrição é a chave: o método não se importa se a regra é de preço, volume ou desconto. Ele sabe apenas que, como é um IBusinessRule, ele tem a propriedade priority e, portanto, pode ser ordenado.

Essa abordagem torna o PriorityManager reutilizável para ordenar qualquer tipo de regra de negócio, sem precisar de código duplicado.

### Conclusão

Ao usar genéricos, projeta-se o código de forma inteligente, criando componentes que são mais flexíveis e reutilizáveis. As constraints complementam essa abordagem, garantindo que a segurança de tipo seja mantida e que o seu código permaneça robusto e previsível.