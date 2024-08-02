# Documentação de Autenticação e Renovação de Tokens

## Introdução

Esta documentação descreve o processo de autenticação e renovação de tokens na aplicação Coinpay. A autenticação é baseada em tokens JWT (JSON Web Tokens) para garantir a segurança e a integridade das sessões dos usuários.

## Autenticação Inicial

### Login

Quando o usuário faz login no aplicativo fornecendo suas credenciais (email e senha), o serviço de autenticação valida as credenciais e, se forem válidas, gera e retorna dois tokens:

- **Token de Acesso**: Um token JWT com validade curta (15 minutos).
- **Refresh Token**: Um token JWT com validade mais longa (30 dias).

### Exemplo de Requisição de Login

```json
POST /auth
Content-Type: application/json

{
  "email": "usuario@example.com",
  "password": "senha"
}
```

### Exemplo de Resposta de Login
```json
200 OK
Content-Type: application/json

{
  "access_token": "<token de acesso>",
  "refresh_token": "<refresh token>"
}
```

## Uso do Token de Acesso
O token de acesso é usado para autenticar e autorizar o usuário em cada requisição à API. Ele deve ser incluído no cabeçalho da requisição.

### Exemplo de Requisição com Token de Acesso
```json
GET /dados-pessoais
Authorization: Bearer <token de acesso>
```

## Renovação do Token de Acesso
Antes que o token de acesso expire, ou quando ele expira e o usuário ainda está logado no aplicativo, o aplicativo deve usar o refresh token para obter um novo token de acesso. Isso é feito enviando uma requisição ao endpoint de renovação com o refresh token.

### Exemplo de Requisição para Renovar o Token
```json
POST /auth/refresh
Content-Type: application/json

{
  "refresh_token": "<refresh token>"
}
```

### Exemplo de Resposta de Renovação
```json
200 OK
Content-Type: application/json

{
  "access_token": "<novo token de acesso>"
}
```

## Conteúdo dos Tokens
### Payload do Access Token
O access_token é usado para autenticar e autorizar o usuário em cada requisição à API. Ele contém informações sobre o usuário e tem uma validade curta. O payload do access_token geralmente inclui:
- sub (Subject): Identificador único do usuário.
- iat (Issued At): Timestamp de quando o token foi emitido.
- exp (Expiration): Timestamp de quando o token expira.
- aud (Audience): Destinatário do token (geralmente a URL da API).
- iss (Issuer): Emissor do token (geralmente a URL do servidor de autenticação).
- roles: Papel ou permissões do usuário (opcional).

### Exemplo de Payload de um Access Token
```json
{
  "sub": "1234567890",
  "name": "John Doe",
  "iat": 1615788450,
  "exp": 1615789350,
  "aud": "http://api.example.com",
  "iss": "http://auth.example.com",
  "roles": ["user"]
}
```

### Payload do Refresh Token
O refresh_token é usado para obter um novo access_token sem que o usuário precise fornecer suas credenciais novamente. Ele tem uma validade mais longa e geralmente não contém muitas informações além do identificador do usuário e informações de expiração.
- sub (Subject): Identificador único do usuário.
- iat (Issued At): Timestamp de quando o token foi emitido.
- exp (Expiration): Timestamp de quando o token expira.
- aud (Audience): Destinatário do token (geralmente a URL da API).
- iss (Issuer): Emissor do token (geralmente a URL do servidor de autenticação).

### Exemplo de Payload de um Refresh Token
```json
{
  "sub": "1234567890",
  "iat": 1615788450,
  "exp": 1620972450,
  "aud": "http://api.example.com",
  "iss": "http://auth.example.com"
}
```

## Segurança dos Tokens
Access Token: Deve ser armazenado de forma segura usando as APIs de armazenamento seguro fornecidas pelo sistema operacional móvel (como Keychain no iOS ou Keystore no Android).
Refresh Token: Também deve ser armazenado de forma segura utilizando as mesmas APIs para prevenir acesso não autorizado.
