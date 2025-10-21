# n8n on Railway - Full Power Setup

🔥 Complete n8n automation server ready for Railway deployment with PostgreSQL and API access.

## 🚀 Quick Deploy to Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/n8n-railway)

## ✅ What's Included

- **n8n Server** - Latest version with all features
- **PostgreSQL Database** - Automatic connection
- **Webhook Support** - External triggers ready
- **API Access** - Create workflows programmatically
- **Basic Auth** - Secure access out of the box
- **Environment Variables** - Pre-configured

## 📦 Features

- ✅ **525+ Nodes** - Connect to anything
- ✅ **24/7 Workflows** - Always running
- ✅ **Webhooks** - Receive external events
- ✅ **Scheduled Tasks** - Cron jobs built-in
- ✅ **API Access** - Automate workflow creation
- ✅ **PostgreSQL** - Persistent storage
- ✅ **Production Ready** - Scalable infrastructure

## 🔧 Railway Deployment Steps

### 1. Click "Deploy on Railway" button above

### 2. Configure Environment Variables

Railway will auto-configure PostgreSQL, but you need to set:

```
N8N_BASIC_AUTH_USER=your_email@example.com
N8N_BASIC_AUTH_PASSWORD=your_secure_password
```

### 3. Deploy!

Railway will:
- Create PostgreSQL database
- Deploy n8n server
- Connect them automatically
- Generate public URL

### 4. Access n8n

After deployment:
```
URL: https://your-n8n-production.up.railway.app
Username: your_email@example.com
Password: your_secure_password
```

### 5. Get API Key

1. Login to n8n
2. Settings → API
3. Create new API key
4. Save it securely

## 🎯 Use with n8n-mcp

**Claude Desktop Configuration:**

```json
{
  "mcpServers": {
    "n8n-mcp": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm", "--init",
        "-e", "N8N_API_URL=https://your-n8n-production.up.railway.app",
        "-e", "N8N_API_KEY=your_api_key_here",
        "ghcr.io/czlonkowski/n8n-mcp:latest"
      ]
    }
  }
}
```

**Config Location:**
```bash
~/Library/Application Support/Claude/claude_desktop_config.json
```

After restart, Jean Claude can:
- Create workflows via chat
- Deploy them automatically to Railway
- Manage 525+ n8n nodes
- Build automation from voice commands

## 💰 Cost

**Railway Pricing:**
- n8n server: ~$5-10/month
- PostgreSQL: ~$5/month
- **Total: ~$10-15/month**

**Value:**
- Unlimited workflows
- 24/7 operation
- No operation limits
- Full API access
- Production ready

## 🔗 Integration Examples

### With Annoris API

```javascript
// n8n HTTP Request Node → Annoris API
{
  "method": "POST",
  "url": "https://annoris-api.railway.app/api/v1/sessions",
  "body": {
    "content": "{{$json.data}}",
    "project_id": "brain-index-geo"
  }
}
```

### Telegram Bot

```javascript
// Telegram Trigger → Process → Respond
Workflow:
1. Telegram Trigger (incoming message)
2. HTTP Request (process data)
3. Telegram Send (reply to user)
```

### Scheduled Reports

```javascript
// Cron → Fetch Data → Send Email
Schedule: "0 9 * * 1" (Every Monday 9am)
Action: Generate and email weekly report
```

## 📚 Documentation

- **n8n Docs:** https://docs.n8n.io
- **Railway Docs:** https://docs.railway.app
- **n8n-mcp:** https://github.com/czlonkowski/n8n-mcp

## 🛠️ Manual Setup (Alternative)

If you prefer manual Railway setup:

```bash
# 1. Install Railway CLI
npm install -g @railway/cli

# 2. Login
railway login

# 3. Create project
railway init

# 4. Add PostgreSQL
railway add postgresql

# 5. Deploy
railway up
```

## 🔒 Security

**Included:**
- Basic Auth (username/password)
- API key authentication
- HTTPS via Railway
- Environment variable secrets

**Recommended:**
- Use strong passwords
- Rotate API keys regularly
- Limit API key scope
- Monitor access logs

## 🎯 Next Steps

1. **Deploy** n8n to Railway
2. **Get API key** from n8n settings
3. **Configure** Claude Desktop with n8n-mcp
4. **Create** your first workflow via Jean Claude
5. **Deploy** Annoris API for data storage
6. **Build** automation products!

## 💡 Use Cases

**Custom Automation:**
- Client workflows: €500-2000 setup
- Monthly maintenance: €50-200
- Additional features: €100-500

**SAAS Products:**
- Telegram bots: €99/month
- Brain Index GEO Bot
- Custom business automation
- 80-90% profit margin!

## 📊 Architecture

```
Claude Desktop (Jean)
    ↓
n8n-mcp (525+ nodes)
    ↓
Railway n8n Server (24/7)
    ├─ PostgreSQL (storage)
    ├─ Webhooks (external)
    ├─ Annoris API (data)
    └─ Telegram Bots
```

---

**Created:** October 21, 2025  
**Status:** Production Ready 🚀  
**License:** MIT

**Deploy now and start building!**
