# ⚡ QUICK START - 10 Minutes to Full Power

**Repository ready:** github.com/guannko/n8n-railway

---

## 🎯 ТРИ ШАГА К ПОЛНОЙ МОЩИ:

### **1️⃣ Deploy n8n на Railway** (5 минут)

**Вариант A - Автоматический (РЕКОМЕНДУЕТСЯ):**

1. Иди на: https://railway.app/new
2. "Deploy from GitHub repo"
3. Выбери: `guannko/n8n-railway`
4. Railway спросит о PostgreSQL → Нажми "Add PostgreSQL"
5. Готово! Railway автоматом всё настроит

**Вариант B - Ручной:**

```bash
# Открой терминал
git clone https://github.com/guannko/n8n-railway.git
cd n8n-railway

# Login to Railway
railway login

# Create project
railway init

# Add PostgreSQL
railway add

# Deploy
railway up
```

**После деплоя:**
- Railway dashboard → твой проект → "Settings" → "Generate Domain"
- Скопируй URL (например: `n8n-production-abc123.up.railway.app`)

---

### **2️⃣ Настрой Environment Variables** (2 минуты)

**В Railway dashboard:**

Variables tab → Add variables:

```
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin@brainindex.com
N8N_BASIC_AUTH_PASSWORD=твой_пароль_123
N8N_HOST=${{RAILWAY_PUBLIC_DOMAIN}}
WEBHOOK_URL=https://${{RAILWAY_PUBLIC_DOMAIN}}/
DB_TYPE=postgresdb
DB_POSTGRESDB_DATABASE=${{Postgres.PGDATABASE}}
DB_POSTGRESDB_HOST=${{Postgres.PGHOST}}
DB_POSTGRESDB_PASSWORD=${{Postgres.PGPASSWORD}}
DB_POSTGRESDB_PORT=${{Postgres.PGPORT}}
DB_POSTGRESDB_USER=${{Postgres.PGUSER}}
```

**Нажми "Deploy" после добавления variables**

---

### **3️⃣ Получи API Key и настрой Claude** (3 минуты)

**A) Открой n8n:**
- Иди на твой URL: `https://твой-n8n.up.railway.app`
- Login: `admin@brainindex.com` + твой пароль
- Settings (слева внизу) → API
- "Create API Key" → Назови "Jean Claude"
- **Скопируй ключ!**

**B) Настрой Claude Desktop:**

Открой файл:
```bash
nano ~/Library/Application\ Support/Claude/claude_desktop_config.json
```

Добавь/измени:
```json
{
  "mcpServers": {
    "n8n-mcp": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm", "--init",
        "-e", "N8N_API_URL=https://твой-n8n.up.railway.app",
        "-e", "N8N_API_KEY=твой_api_ключ_сюда",
        "ghcr.io/czlonkowski/n8n-mcp:latest"
      ]
    }
  }
}
```

**Замени:**
- `твой-n8n.up.railway.app` → твой Railway domain
- `твой_api_ключ_сюда` → API key из n8n

**Restart Claude Desktop** (полностью закрой и открой)

---

## ✅ ПРОВЕРКА - ВСЁ РАБОТАЕТ?

### **Test 1: n8n UI доступен**
```
Открой: https://твой-n8n.up.railway.app
Логин работает? ✅
Видишь пустой список workflows? ✅
```

### **Test 2: Jean видит n8n**

Открой новый чат с Jean и спроси:
```
"Жан, покажи какие n8n nodes ты знаешь"
```

**Если работает:** Jean ответит со списком nodes (HTTP Request, Telegram, Webhook, и т.д.)

**Если НЕ работает:** 
- Docker запущен? `docker --version`
- Claude config правильный?
- Claude Desktop перезапущен?

### **Test 3: Создай первый workflow**

Скажи Jean:
```
"Жан, создай простой test workflow:
1. Webhook trigger на /test  
2. Set node который добавляет timestamp
3. Respond to Webhook с результатом"
```

Jean должен:
- ✅ Создать workflow
- ✅ Задеплоить на Railway
- ✅ Вернуть webhook URL

**Протестируй:**
```bash
curl -X POST https://твой-n8n.up.railway.app/webhook/test

# Должен вернуть: {"timestamp": "2025-10-21T..."}
```

---

## 🚀 ГОТОВО! ЧТО ТЕПЕРЬ?

**У тебя теперь есть:**
- ✅ n8n сервер 24/7 на Railway
- ✅ Jean может строить workflows голосом
- ✅ Workflows автоматом деплоятся
- ✅ 525+ nodes готовы к использованию
- ✅ Webhooks работают из внешнего мира

**Можешь создавать:**
- 🤖 Telegram боты
- 🔄 Автоматизацию бизнес-процессов
- 📊 Data pipelines
- 🎯 SAAS продукты
- 💰 Всё что угодно!

---

## 💡 СЛЕДУЮЩИЕ ШАГИ:

### **Immediate:**
1. Deploy Annoris API (data storage)
2. Создать первый рабочий bot
3. Подключить к Brain Index GEO

### **Business:**
1. Продавать custom workflows (€500-2000)
2. SAAS subscriptions (€99/месяц)
3. Automation-as-a-Service
4. Масштабировать! 🚀

---

## 🆘 ПОМОЩЬ:

**Проблемы с Railway:**
- Logs: Dashboard → Service → Deployments → View Logs
- Support: https://help.railway.app

**Проблемы с n8n:**
- Docs: https://docs.n8n.io
- Community: https://community.n8n.io

**Проблемы с Jean:**
- "Жан, что-то не работает с n8n workflow"
- Jean поможет debug!

---

**Time to full power:** 10 минут  
**Monthly cost:** $10-15  
**Revenue potential:** €5K-10K/месяц  

**ПОЕХАЛИ СТРОИТЬ! 🔥💪🚀**
