# Padronização de commits
## Estrutura
```
<empresa>-<projeto>: <tipo>: <ID do ticket> - <mensagem>
```

Exemplos
- TIISDE-0001: feat: ADD-1234 - Implement user authentication
- TIISDE-0001: fix: ADD-5678 - Correct login issue
- TIISDE-0001: docs: ADD-9101 - Update README with setup instructions
- TIISDE-0001: refactor: ADD-1121 - Improve authentication service structure

## Descrição dos componentes
empresa-projeto:
- empresa: Nome da empresa (pode ser um acrônimo).
- projeto: Identificador do projeto.

tipo:
- feat: Uma nova funcionalidade.
- fix: Correção de um bug.
- docs: Alterações na documentação.
- style: Mudanças que não afetam o significado do código (espaços em branco, formatação, ponto e vírgula faltando, etc).
- refactor: Refatoração de código que não corrige um bug nem adiciona uma funcionalidade.
- test: Adição ou correção de testes.
- chore: Atualizações de tarefas de build, ferramentas, dependências, etc.
- perf: Alterações que melhoram o desempenho.
- ci: Mudanças em arquivos de configuração e scripts de CI (ex.: GitHub Actions, CircleCI, etc).

ID do ticket:
- O identificador único do ticket, história, ou tarefa associada a esse commit.

mensagem:
- Uma descrição clara e concisa do que foi feito.

## Padrão de Commits
TIISDE-0001: <tipo>: <ID do ticket> - <mensagem>

## Exemplos de Commits
- Adicionar uma nova funcionalidade:
```
TIISDE-0001: feat: ADD-1234 - Implement user authentication
```

- Corrigir um bug:
```
TIISDE-0001: fix: ADD-5678 - Correct login issue
```

- Atualizar a documentação:
```
TIISDE-0001: docs: ADD-9101 - Update README with setup instructions
```

- Refatorar código:
```
TIISDE-0001: refactor: ADD-1121 - Improve authentication service structure
```
