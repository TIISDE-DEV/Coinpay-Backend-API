# Documentação de Adição de Cartões de Crédito - Coinpay

## 1. Requisitos Funcionais

### Campos Obrigatórios
- **Account Holder Name**: Nome do titular da conta.
- **Email**: Email associado ao cartão.
- **Card Number**: Número do cartão de crédito.

### Funcionalidade
- O usuário pode adicionar um ou mais cartões de crédito após a criação da conta.
- Cada cartão adicionado será vinculado à conta do usuário no sistema.

## 2. Fluxo de Adição de Cartão de Crédito

1. **Entrada do Usuário**:
   - O usuário navega até a seção de cartões de crédito no aplicativo.
   - Insere o nome do titular da conta, email e número do cartão de crédito.

2. **Processamento no Backend**:
   - **Validação dos Dados**:
     - O número do cartão é validado para verificar o formato correto (por exemplo, Luhn Algorithm).
     - O email é validado para garantir que está no formato correto.
   - **Armazenamento Seguro**:
     - O número do cartão é armazenado de forma segura (com criptografia).
     - O nome do titular e o email são associados ao número do cartão.

3. **Resposta ao Usuário**:
   - O usuário recebe uma confirmação de que o cartão foi adicionado com sucesso.
   - O cartão aparece na lista de cartões do usuário dentro do aplicativo.
