# AltForce - Sistema de Orçamento Dinâmico

Este projeto é a solução para o teste prático, focado na criação de um sistema 
de orçamento dinâmico e inteligente. A arquitetura foi desenvolvida para ser escalável, 
manutenível e flexível, seguindo os princípios de Design Orientado a Objetos (POO) e padrões 
de projeto de software.

<p align='center'>
    <img src="https://raw.githubusercontent.com/d-apps/altforce_budget_module/refs/heads/main/screenshots/1.png" />
    <img src="https://raw.githubusercontent.com/d-apps/altforce_budget_module/refs/heads/main/screenshots/2.png" />
    <img src="https://raw.githubusercontent.com/d-apps/altforce_budget_module/refs/heads/main/screenshots/3.png" />
    <img src="https://raw.githubusercontent.com/d-apps/altforce_budget_module/refs/heads/main/screenshots/4.png" />
</p>

### Arquitetura e Conceitos-Chave

O projeto é construído em torno dos seguintes pilares:

### Engine de Regras (RuleEngine): 

Uma classe central que orquestra a aplicação de regras de negócio. Ela não contém a lógica das 
regras, mas delega essa responsabilidade.

Foram criadas as Rules QuantityDiscountRule, SlaTaxRule e ValidationRule.

### Polimorfismo e Genéricos: 

O código utiliza polimorfismo (Product como classe base) e 
genéricos (IRepository<T>) para processar uma lista de tipos de produtos de forma uniforme 
e garantir a segurança de tipos em tempo de compilação.

### Formulário Dinâmico e Factory Pattern: 

A interface do usuário se adapta em tempo real. 
Um Factory Pattern (DynamicFormFactory) é usado para criar dinamicamente os widgets do 
formulário com base no tipo de produto.

### DRY (Don't Repeat Yourself): 

Lógicas comuns, como a validação e o cálculo de preços, 
são centralizadas na RuleEngine e suas estratégias, evitando duplicação de código.

## Instruções de Execução

Para executar o projeto, siga os passos abaixo:

Instale as Dependências:

Navegue até a pasta do projeto e execute o comando para instalar as dependências do Flutter.

flutter pub get

Execute o Projeto:

Conecte um dispositivo ou inicie um emulador e execute o projeto com o comando:

flutter run