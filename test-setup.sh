#!/bin/bash
# test-setup.sh - Script untuk testing My-Mail secara lokal

echo "🚀 Setting up My-Mail for Local Testing"
echo "========================================"

# 1. Clone repo
git clone https://github.com/andrizpray/My-Mail.git
cd My-Mail

# 2. Install dependencies frontend
cd mail-vue
echo "📦 Installing frontend dependencies..."
pnpm install

# 3. Build frontend
echo "🔨 Building frontend..."
pnpm run build

# 4. Install dependencies worker
cd ../mail-worker
echo "📦 Installing worker dependencies..."
pnpm install

# 5. Run local development server
echo "🌐 Starting local development server..."
echo "Server akan jalan di http://localhost:8787"
npx wrangler dev --config wrangler-dev.toml --local

# 6. Init database (jalankan di terminal lain setelah server start)
echo ""
echo "📝 Setelah server jalan, buka terminal baru dan jalankan:"
echo "curl http://localhost:8787/api/init/5de8a3fe4a9be643155e8f75099979485cd1a02d4c1130ea525a0c051a81d324"