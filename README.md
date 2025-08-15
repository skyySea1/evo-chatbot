\evo
Fluxos e automações n8n do projeto Evo Chatbot.


# Evo Chatbot – Automação (n8n)

Repositório privado para armazenamento de fluxos, scripts de suporte e documentação das automações do projeto **Evo Chatbot** utilizando **n8n**.

## Estrutura

- `flows/` Exportações de workflows (`.json`).
- `scripts/` Utilitários (export/import via API).
- `docker/` Arquivos para subir stack local (n8n + Postgres).
- `credentials/` (Opcional) Exemplos/mocks (NUNCA subir credenciais reais).
- `.github/workflows/` (Opcional) Pipelines de validação.
- `.gitignore` Protege arquivos sensíveis.

## Início Rápido (Docker)

```bash
cd docker
cp env/n8n.env.example env/n8n.env
# Edite senhas/chaves
docker compose up -d
```

Acesse: http://localhost:5678

## Exportar Workflow Manualmente

No editor do n8n: Menu (⋮) > Export > Download → salvar em `flows/` com padrão `NNN-descricao.json`.

## Convenção de Nomes

`<ordem>-<dominio>-<ação>.json`  
Ex: `020-whatsapp-routing.json` , `030-crm-sync.json`

## Variáveis de Ambiente (principais)

| Variável | Uso |
|----------|-----|
| `N8N_BASIC_AUTH_ACTIVE` | Ativa auth básica |
| `N8N_BASIC_AUTH_USER` / `N8N_BASIC_AUTH_PASSWORD` | Credenciais do painel |
| `DB_TYPE` / `DB_POSTGRESDB_*` | Config banco |
| `N8N_ENCRYPTION_KEY` | Criptografar credenciais internas |
| `WEBHOOK_URL` | URL pública atrás de proxy |
| `GENERIC_TIMEZONE` | Timezone dos agendamentos |

## Boas Práticas

1. Nunca commitar `.env` ou chaves secretas.
2. Sempre revisar JSON de workflow para remover dados sensíveis.
3. Documentar no README (ou em `docs/`) novas variáveis usadas.
4. Criar issue/PR para cada novo fluxo complexo.

## Roteiro Futuro (Roadmap)

- [ ] Script de exportação/backup agendado
- [ ] Workflow de CI validando JSON em `flows/`
- [ ] Template de Pull Request
- [ ] Padronização de logs & retries

## Checklist de Commit

- [ ] Nenhuma credencial real
- [ ] JSON válido (testado com `jq . < arquivo.json`)
- [ ] README/variáveis atualizadas
- [ ] Testado local

---
Qualquer ajuste que precisar, abra uma issue interna (privada) ou peça aqui.
