# AltForce - Sistema de Orçamento Dinâmico

### Este projeto é a solução para o teste prático da AltForce, focado na criação de um sistema 
##  de orçamento dinâmico e inteligente. A arquitetura foi desenvolvida para ser escalável, 
## manutenível e flexível, seguindo os princípios de Design Orientado a Objetos (POO) e padrões 
## de projeto de software.

## Arquitetura e Conceitos-Chave

### O projeto é construído em torno dos seguintes pilares:

### Engine de Regras (RuleEngine): 

## Uma classe central que orquestra a aplicação de regras de negócio. Ela não contém a lógica das 
## regras, mas delega essa responsabilidade a componentes especializados (ConditionEvaluator, 
## ActionExecutor, PriorityManager), aplicando o princípio de Composição sobre Herança.

### Polimorfismo e Genéricos: 

## O código utiliza polimorfismo (Product como classe base) e 
## genéricos (IRepository<T>) para processar uma lista de tipos de produtos de forma uniforme 
## e garantir a segurança de tipos em tempo de compilação.

### Formulário Dinâmico e Factory Pattern: 

## A interface do usuário se adapta em tempo real. 
## Um Factory Pattern (ProductFormFactory) é usado para criar dinamicamente os widgets do 
## formulário com base no tipo de produto, evitando o uso de longas cadeias de if/else.

### Princípio de Responsabilidade Única (SRP): 

## Cada classe e arquivo tem uma responsabilidade clara 
## e única. Por exemplo, a lógica de precificação está em PricingStrategy, a de visibilidade 
## em VisibilityStrategy, e o QuoteController apenas orquestra essas ações.

### DRY (Don't Repeat Yourself): 

## Lógicas comuns, como a validação e o cálculo de preços, 
## são centralizadas na RuleEngine e suas estratégias, evitando duplicação de código.

### Cenários de Teste e Implementação

## O sistema atende a todos os cenários de teste obrigatórios:

### Produto Industrial: A RuleEngine, ao processar um produto industrial, aciona uma VisibilityRule que torna os campos Voltagem e Certificação visíveis. A ValidationRule garante que, se a voltagem for maior que 220V, a certificação se torne um campo obrigatório.

### Regras de Preço:

### Desconto por Volume: 
## Se a quantidade de um produto for maior que 100, uma PricingStrategy de volume aplica um 
## desconto de 10% no preço base.

### Desconto VIP: A RuleEngine verifica o tipo de cliente e, se for VIP, aplica uma PricingStrategy 
## adicional para conceder um desconto extra.

### Troca de Produto: 

## Ao selecionar um novo produto (ex: de industrial para residencial), 
##  o QuoteController aciona o ProductFormFactory que renderiza o formulário correto, e a 
## RuleEngine aplica as regras correspondentes ao novo tipo.

### Instruções de Execução
## Para executar o projeto, siga os passos abaixo:

### Instale as Dependências:

## Navegue até a pasta do projeto e execute o comando para instalar as dependências do Flutter.

flutter pub get

### Execute o Projeto:

## Conecte um dispositivo ou inicie um emulador e execute o projeto com o comando:

flutter run