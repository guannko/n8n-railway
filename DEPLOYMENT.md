# 🚀 n8n Railway Deployment Guide

Step-by-step guide to deploy n8n automation server on Railway.

---

## 📋 Prerequisites

- Railway account (free tier works)
- Docker installed locally (for n8n-mcp later)
- Claude Desktop (for automation)

---

## 🔧 Deployment Steps

### **Step 1: Create Railway Project** (2 minutes)

1. Go to [railway.app](https://railway.app)
2. Click "New Project"
3. Select "Deploy from GitHub repo"
4. Connect your GitHub account
5. Select `guannko/n8n-railway` repository

### **Step 2: Add PostgreSQL** (1 minute)

1. In your Railway project, click "New"
2. Select "Database" → "PostgreSQL"
3. Railway will create and configure it automatically

### **Step 3: Configure Environment Variables** (2 minutes)

Click on your n8n service → "Variables" tab:

**Required variables:**
```
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin@brainindex.com
N8N_BASIC_AUTH_PASSWORD=YourSecurePassword123!
```

**Auto-configured by Railway (verify they exist):**
```
DB_TYPE=postgresdb
DB_POSTGRESDB_DATABASE=${{Postgres.PGDATABASE}}
DB_POSTGRESDB_HOST=${{Postgres.PGHOST}}
DB_POSTGRESDB_PASSWORD=${{Postgres.PGPASSWORD}}
DB_POSTGRESDB_PORT=${{Postgres.PGPORT}}
DB_POSTGRESDB_USER=${{Postgres.PGUSER}}
N8N_HOST=${{RAILWAY_PUBLIC_DOMAIN}}
WEBHOOK_URL=https://${{RAILWAY_PUBLIC_DOMAIN}}/
```

### **Step 4: Deploy!** (1 minute)

1. Railway will auto-deploy after variables are set
2. Wait for build to complete (~2-3 minutes)
3. Check "Deployments" tab for status

### **Step 5: Access n8n UI** (1 minute)

1. Go to "Settings" tab
2. Find "Public Domain" (something like: `n8n-railway-production.up.railway.app`)
3. Click the URL
4. Login with your credentials:
   - Username: `admin@brainindex.com`
   - Password: Your password from Step 3

---

## 🔑 Get API Key (Required for n8n-mcp)

### **In n8n UI:**

1. Click your profile (bottom left)
2. Settings → API
3. Click "Create API Key"
4. Name it: "Jean Claude MCP"
5. **Copy and save the key** (you'll need it for Claude Desktop)

---

## 🖥️ Setup Claude Desktop with n8n-mcp

### **Step 1: Install Docker** (if not already)

```bash
# Check if Docker is installed
docker --version

# If not, download from: https://www.docker.com/products/docker-desktop
```

### **Step 2: Configure Claude Desktop**

Edit config file:
```bash
nano ~/Library/Application\ Support/Claude/claude_desktop_config.json
```

Add n8n-mcp server:
```json
{
  "mcpServers": {
    "n8n-mcp": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm", "--init",
        "-e", "N8N_API_URL=https://your-n8n-railway-production.up.railway.app",
        "-e", "N8N_API_KEY=your_api_key_from_step_above",
        "ghcr.io/czlonkowski/n8n-mcp:latest"
      ]
    }
  }
}
```

**Replace:**
- `your-n8n-railway-production.up.railway.app` → Your Railway domain
- `your_api_key_from_step_above` → Your API key from n8n

### **Step 3: Restart Claude Desktop**

1. Quit Claude Desktop completely
2. Open it again
3. Open a new chat with Jean Claude

### **Step 4: Test the Connection**

Ask Jean in chat:
```
"Жан, покажи какие n8n nodes ты знаешь"
```

Jean should respond with list of available nodes (525+ nodes!)

---

## ✅ Verify Everything Works

### **Test 1: n8n UI Access**
- ✅ Can login to n8n
- ✅ Can see empty workflows page
- ✅ Can create manual test workflow

### **Test 2: API Access**
```bash
# Test API with curl
curl -X GET \
  https://your-n8n-railway.up.railway.app/api/v1/workflows \
  -H "X-N8N-API-KEY: your_api_key"

# Should return: {"data": []}
```

### **Test 3: Jean Claude Integration**
Ask Jean:
```
"Жан, создай простой test workflow с webhook trigger"
```

Jean should:
- Build workflow JSON
- Deploy it to Railway
- Give you webhook URL

---

## 🎯 Create First Workflow via Jean

### **Example Request:**

```
"Жан, создай workflow:
1. Webhook trigger на /test
2. HTTP Request к Annoris API (POST /api/v1/sessions)
3. Отправь результат в Telegram"
```

### **Jean will:**
1. Build workflow with proper nodes
2. Configure connections
3. Deploy to Railway
4. Give you webhook URL + Telegram bot setup

### **Test it:**
```bash
curl -X POST https://your-n8n.railway.app/webhook/test \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello from workflow!"}'
```

---

## 💰 Cost Monitoring

**Railway Dashboard → Project → Usage:**

- n8n service: ~$5-10/month
- PostgreSQL: ~$5/month
- Total: ~$10-15/month

**Free tier includes:**
- $5 credit/month
- Good for testing!

---

## 🔧 Troubleshooting

### **n8n won't start:**
```
Check logs: Railway dashboard → n8n service → Logs
Common issues:
- PostgreSQL not connected (wait 1 minute)
- Environment variables missing
- Port 5678 not exposed
```

### **Can't login:**
```
Verify variables:
- N8N_BASIC_AUTH_ACTIVE=true
- Username/password set correctly
- Try password reset in Railway
```

### **API key doesn't work:**
```
- Regenerate key in n8n UI
- Check spelling in Claude config
- Restart Claude Desktop
```

### **Jean can't connect:**
```
- Docker running? (docker --version)
- Config file correct?
- Claude Desktop restarted?
- API URL includes https://
```

---

## 🚀 Next Steps

After successful deployment:

1. ✅ **Deploy Annoris API** (data storage)
2. ✅ **Create first automation workflow**
3. ✅ **Setup Telegram bot**
4. ✅ **Build SAAS product**
5. ✅ **Start selling! €99/month**

---

## 📚 Resources

- **n8n Docs:** https://docs.n8n.io
- **Railway Docs:** https://docs.railway.app
- **n8n-mcp GitHub:** https://github.com/czlonkowski/n8n-mcp
- **Annoris API:** https://github.com/guannko/annoris-api

---

**Deployment Time:** ~10 minutes  
**Monthly Cost:** ~$10-15  
**Value:** Unlimited workflows, 24/7, production-ready!

**Ready to automate? Deploy now! 🔥**
