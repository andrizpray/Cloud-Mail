#!/bin/bash
cd /home/ubuntu/cloud-mail/mail-vue
exec > /tmp/vite-dev.log 2>&1
exec node node_modules/.pnpm/vite@7.1.5_less@4.4.1_sass@1.91.0_terser@5.43.1/node_modules/vite/bin/vite.js --mode dev --host 0.0.0.0
