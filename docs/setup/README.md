# Documentação de "Account Setup" - Coinpay

## 1. Requisitos Funcionais

### Criação de Conta - Campos Obrigatórios
- **Phone**: Deve incluir o código de país.
- **Password**: Deve seguir regras específicas de complexidade (ex.: mínimo de 8 caracteres, incluindo uma letra maiúscula, uma minúscula, um número e um caractere especial).

### Verificação da Conta - Campos Opcionais
- **Email**
- **Address Line**
- **City**
- **Post Code**
- **Full Name**
- **Username**
- **Date of Birth**
- **Country of Residence**
- **Photo**

## 2. Arquitetura Geral

### Frontend (Mobile App)
- **Tela de Criação de Conta**: Coleta número de telefone e senha.
- **Tela de Verificação (Account Setup)**: Opcionalmente coleta email, endereço, nome, etc.
- **Feedback ao Usuário**: O usuário é notificado sobre o status de verificação.

### Backend (Serviço de Autenticação e Gestão de Contas)
- **Endpoint de Criação de Conta**: 
  - Recebe telefone e senha.
  - Cria o usuário na base de dados.
  - Retorna um token de autenticação.

- **Endpoint de Verificação**:
  - Recebe dados adicionais e atualiza o status de verificação do usuário.

- **Validação e Armazenamento**:
  - **Telefone**: Valida o código de país e formato.
  - **Senha**: Aplica regras de complexidade.

### Infraestrutura
- **Autenticação e Autorização**: Uso de JWT para acessar recursos protegidos.
- **Armazenamento Seguro**: Hash de senhas e criptografia de dados sensíveis.
- **Serviços Externos**:
  - **Verificação de Telefone**: API para validação do número.
  - **Serviços de Upload**: Para armazenar a foto do usuário.

## 3. Fluxo de Criação de Conta

1. **Entrada do Usuário**:
   - O usuário insere o número de telefone e cria uma senha que atende aos requisitos de complexidade.
   - A senha é validada no frontend e backend.

2. **Criação de Conta no Backend**:
   - O backend valida o telefone (verifica o código do país e formato).
   - O backend faz o hash da senha e cria um registro na tabela de usuários com o status de verificação como "não verificado".

3. **Resposta ao Usuário**:
   - O usuário recebe um token de autenticação para acessar o aplicativo.

## 4. Fluxo de Verificação de Conta

1. **Entrada do Usuário (Opcional)**:
   - O usuário acessa a tela de verificação e preenche os dados adicionais.
   - Foto e outros dados são enviados ao backend.

2. **Processamento no Backend**:
   - O backend armazena os dados adicionais e atualiza o status de verificação.
   - A foto é armazenada em um serviço seguro.

3. **Resposta ao Usuário**:
   - O usuário é notificado sobre o status de verificação (em andamento ou completo).
