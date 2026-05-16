<p align="center">
    <img src="doc/demo/logo.png" width="80px" />
    <h1 align="center">My-Mail</h1>
    <p align="center">A custom fork of Cloud Mail — personal email service with your own customizations 🎉</p> 
    <p align="center">
        <a href="README.md" style="margin-left: 5px">English</a> | <a href="/README-zh.md" style="margin-left: 5px">简体中文</a>
    </p>
    <p align="center">
        <a href="https://github.com/andrizpray/My-Mail/blob/main/LICENSE" target="_blank" >
            <img src="https://img.shields.io/badge/license-MIT-green" />
        </a>   
        <img src="https://img.shields.io/badge/status-custom%20fork-blue" />
        <img src="https://img.shields.io/badge/powered%20by-cloudflare-orange" />
    </p>
</p>

> **⚠️ DISCLAIMER**  
> This is a **custom fork** of [maillab/cloud-mail](https://github.com/maillab/cloud-mail).  
> Original author: [maillab/cloud-mail](https://github.com/maillab/cloud-mail)  
> This fork is maintained by [andrizpray](https://github.com/andrizpray) with custom modifications.  
> **All credits belong to the original project.**

---

## 📖 About My-Mail

My-Mail is a personal email service based on Cloudflare Workers. This fork includes custom modifications and enhancements tailored for specific needs. 

With just one domain, you can create and manage multiple email addresses — similar to major email platforms. Designed to run on Cloudflare Workers, it eliminates traditional server costs while giving you full control over your email infrastructure.

---

## ✨ Features

- **💰 Low Cost** — Deploys on Cloudflare Workers, reducing server expenses
- **💻 Responsive Design** — Works seamlessly on desktop and mobile browsers
- **📧 Email Sending** — Integrated with Resend for reliable email delivery
- **🛡️ Admin Panel** — User & email management with RBAC permissions
- **📦 Attachment Support** — Send and receive attachments via Cloudflare R2
- **🔔 Notifications** — Forward emails to Telegram or other providers
- **📡 Open API** — RESTful endpoints for integration
- **📈 Analytics** — Visualize system usage and email statistics
- **🎨 Customizable** — Personalize site appearance and settings

---

## 🛠️ Tech Stack

| Category      | Technology                                      |
|---------------|-------------------------------------------------|
| Platform      | [Cloudflare Workers](https://workers.cloudflare.com/) |
| Web Framework | [Hono](https://hono.dev/)                      |
| ORM           | [Drizzle](https://orm.drizzle.team/)           |
| Frontend      | [Vue 3](https://vuejs.org/)                    |
| UI Library    | [Element Plus](https://element-plus.org/)      |
| Email         | [Resend](https://resend.com/)                  |
| Cache         | [Cloudflare KV](https://developers.cloudflare.com/kv/) |
| Database      | [Cloudflare D1](https://developers.cloudflare.com/d1/) |
| File Storage  | [Cloudflare R2](https://developers.cloudflare.com/r2/) |

---

## 📁 Project Structure

```
My-Mail/
├── mail-worker              # Worker backend
│   ├── src                  
│   │   ├── api              # API routes
│   │   ├── const            # Constants
│   │   ├── dao              # Data access layer
│   │   ├── email            # Email processing
│   │   ├── entity           # Database entities
│   │   ├── error            # Custom exceptions
│   │   ├── hono             # Hono config & middleware
│   │   ├── i18n             # Internationalization
│   │   ├── init             # Database initialization
│   │   ├── model            # Response models
│   │   ├── security         # Authentication
│   │   ├── service          # Business logic
│   │   ├── template         # Message templates
│   │   ├── utils            # Utilities
│   │   └── index.js         # Entry point
│   └── wrangler.toml        # Wrangler config
│
├── mail-vue                 # Vue frontend
│   ├── src
│   │   ├── axios            # HTTP client config
│   │   ├── components       # Vue components
│   │   ├── echarts          # Charts
│   │   ├── i18n             # Multi-language
│   │   ├── layout           # Page layouts
│   │   ├── request          # API layer
│   │   ├── router           # Routes
│   │   ├── store            # State management
│   │   └── views            # Pages
│   └── package.json
```

---

## 🚀 Quick Start

```bash
# Clone this repo
git clone https://github.com/andrizpray/My-Mail.git
cd My-Mail

# Backend setup
cd mail-worker
pnpm install

# Frontend setup  
cd ../mail-vue
pnpm install
cp env.release .env.dev
```

---

## ☁️ Deployment

```bash
# Set up Cloudflare resources (D1, KV, R2)
# Configure wrangler.toml with your IDs

# Deploy
cd mail-worker
npx wrangler deploy
```

---

## 📄 License

This project is licensed under the [MIT](LICENSE) license.  
Original project: [maillab/cloud-mail](https://github.com/maillab/cloud-mail)

---

## 💬 Attribution

This is a custom fork of [maillab/cloud-mail](https://github.com/maillab/cloud-mail).  
**Original project by maillab** — visit their repo for the upstream version.

<span style="color:gray;font-size:12px">
🌟 Star the original: https://github.com/maillab/cloud-mail
</span>