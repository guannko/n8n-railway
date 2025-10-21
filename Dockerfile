FROM n8nio/n8n:latest

# Railway will automatically set these from PostgreSQL service
# No need to manually configure - Railway magic! ✨

# Expose n8n port
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s \
  CMD wget --quiet --tries=1 --spider http://localhost:5678/healthz || exit 1
