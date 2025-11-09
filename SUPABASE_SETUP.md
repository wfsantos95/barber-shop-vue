# 🗄️ Configuração do Supabase - Seven Barber Shop

## 📋 Pré-requisitos

1. Conta no [Supabase](https://supabase.com)
2. Projeto criado no Supabase
3. Variáveis de ambiente configuradas na Vercel

## 🔧 Configuração Inicial

### 1. Variáveis de Ambiente

Certifique-se de que as seguintes variáveis estão configuradas na Vercel:

```env
VITE_SUPABASE_URL=https://seu-projeto.supabase.co
VITE_SUPABASE_ANON_KEY=sua_chave_anonima_aqui
```

### 2. Executar Script SQL

No painel do Supabase, vá em **SQL Editor** e execute o conteúdo do arquivo `supabase-schema.sql`:

```sql
-- O arquivo contém:
-- ✅ Tabelas: services, barbers, customers, appointments, newsletter_subscribers
-- ✅ Dados iniciais dos serviços e barbeiros
-- ✅ Políticas RLS (Row Level Security)
-- ✅ Índices para performance
```

### 3. Configurar RLS (Row Level Security)

As políticas já estão incluídas no script, mas verifique se estão ativas:

- **customers**: Permite inserção pública
- **appointments**: Permite inserção pública
- **newsletter_subscribers**: Permite inserção pública
- **services**: Permite leitura pública (apenas ativos)
- **barbers**: Permite leitura pública (apenas ativos)

## 🚀 Funcionalidades Implementadas

### ✅ Sistema de Agendamentos
- Formulário completo com validação
- Seleção de serviços e profissionais dinâmica
- Prevenção de agendamentos duplicados
- Feedback visual (loading, sucesso, erro)

### ✅ Newsletter
- Inscrição com email único
- Validação de email
- Feedback de sucesso/erro

### ✅ Dados Dinâmicos
- Serviços carregados do banco
- Profissionais carregados do banco
- Preços atualizados automaticamente

## 📊 Estrutura do Banco

### Tabelas Principais

1. **services** - Serviços oferecidos
2. **barbers** - Profissionais da barbearia
3. **customers** - Clientes cadastrados
4. **appointments** - Agendamentos realizados
5. **newsletter_subscribers** - Inscritos na newsletter

### Relacionamentos

```
customers (1) ←→ (N) appointments
barbers (1) ←→ (N) appointments  
services (1) ←→ (N) appointments
```

## 🔍 Monitoramento

### Dashboard Supabase
- **Table Editor**: Visualizar dados em tempo real
- **Authentication**: Gerenciar usuários (se implementado)
- **API**: Documentação automática das APIs
- **Logs**: Monitorar requisições e erros

### Métricas Importantes
- Número de agendamentos por dia
- Serviços mais populares
- Profissionais mais solicitados
- Taxa de inscrição na newsletter

## 🛠️ Próximos Passos (Opcionais)

1. **Autenticação**: Sistema de login para clientes
2. **Dashboard Admin**: Painel para gerenciar agendamentos
3. **Notificações**: Email/SMS de confirmação
4. **Calendário**: Visualização de disponibilidade
5. **Pagamentos**: Integração com Stripe/PagSeguro

## 🐛 Troubleshooting

### Erro de Conexão
- Verifique as variáveis de ambiente
- Confirme se o projeto Supabase está ativo
- Teste a conectividade no console do navegador

### Erro de Permissão
- Verifique se as políticas RLS estão configuradas
- Confirme se as tabelas têm as permissões corretas
- Teste as queries no SQL Editor do Supabase

### Dados Não Aparecem
- Execute o script SQL completo
- Verifique se os dados iniciais foram inseridos
- Confirme se as tabelas estão marcadas como `active = true`
