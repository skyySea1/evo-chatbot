# Flows

Armazena exportações (`.json`) dos workflows do n8n.

Padrão de nome: `NNN-descricao.json`  
- `NNN` = número sequencial ou ID
- `descricao` = curto, kebab-case

Antes de commitar:
- Remover credenciais embutidas
- Validar com `jq . arquivo.json`