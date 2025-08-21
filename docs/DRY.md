# Visão Geral: O que é DRY?

DRY (Don't Repeat Yourself) é um princípio fundamental do desenvolvimento de software. Ele sugere que cada pedaço de conhecimento deve ter uma representação única, clara e autorizada dentro de um sistema. Em outras palavras, se você precisar alterar uma lógica, deve fazê-lo em apenas um lugar.

### 1. Abstração com Interfaces (IRepository, IBusinessRule)

Análise: Em vez de criar um repositório para cada tipo de produto, foi criado uma interface genérica IRepository<T>. O ProductsController depende da interface, e não de uma classe concreta.

Aplicação DRY: Isso evita a duplicação de lógica de acesso a dados. Se a forma de buscar dados mudar, você só precisa alterar a implementação da interface, e não o código de todos os controladores que a utilizam.

### 2. Encapsulamento de Lógica em Serviços (Validação e Prioridade)

Análise: Lógica de ordenação de regras (PriorityManager) e de validação de atributos (AttributesValidator) para classes de serviço dedicadas.

Aplicação DRY: Essa foi uma ótima decisão. A lógica de negócio para ordenar ou validar é centralizada em um único local. Se a regra de ordenação mudar, você a altera apenas em PriorityManager. Se as regras de validação mudarem, a alteração é feita em AttributesValidator.

### 3. Injeção de Dependências

### Análise:

Classes como BudgetController e ProductDetailController não criam instâncias de IRuleEngine ou IToastService diretamente. Em vez disso, elas as recebem como dependências no construtor.

### Aplicação DRY:

Isso desacopla o código. A lógica para exibir um toast (toastService.showErrorToast) é a mesma em todo o projeto. Ao usar um serviço injetável, você evita a repetição de código relacionada à exibição de mensagens e pode até mesmo "injetar" um mock para testes, sem ter que duplicar o código.

### 2. Lógica de Filtragem de Produtos

Análise: No ProductsController foi criado um Map que associa o enum CategoryEnum a um Type, tornando a lógica de filtragem mais dinâmica.