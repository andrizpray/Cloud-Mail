<p align="center">
    <img src="doc/demo/logo.png" width="80px" />
    <h1 align="center">Cloud Mail</h1>
    <p align="center">A minimal, responsive email service built on Cloudflare Workers — send, receive, and manage emails with attachments 🎉</p> 
    <p align="center">
        <a href="README.md" style="margin-left: 5px">English</a> | <a href="/README-zh.md" style="margin-left: 5px">简体中文</a>
    </p>
    <p align="center">
        <a href="https://github.com/andrizpray/cloud-mail/blob/main/LICENSE" target="_blank" >
            <img src="https://img.shields.io/badge/license-MIT-green" />
        </a>    
        <a href="https://github.com/maillab/cloud-mail/releases" target="_blank" >
            <img src="https://img.shields.io/github/v/release/maillab/cloud-mail" alt="releases" />
        </a>  
        <a href="https://github.com/maillab/cloud-mail/issues" >
            <img src="https://img.shields.io/github/issues/maillab/cloud-mail" alt="issues" />
        </a>  
        <a href="https://github.com/maillab/cloud-mail/stargazers" target="_blank">
            <img src="https://img.shields.io/github/stars/maillab/cloud-mail" alt="stargazers" />
        </a>  
        <a href="https://github.com/maillab/cloud-mail/forks" target="_blank" >
            <img src="https://img.shields.io/github/forks/maillab/cloud-mail" alt="forks" />
        </a>
    </p>
    <p align="center">
        <a href="https://trendshift.io/repositories/14418" target="_blank" >
            <img src="https://trendshift.io/api/badge/repositories/14418" alt="trendshift" >
        </a>
    </p>
</p>

> **Forked from [maillab/cloud-mail](https://github.com/maillab/cloud-mail).**  
> This fork is customized and maintained by [andrizpray](https://github.com/andrizpray).

---

## 📖 Introduction

With just one domain, you can create multiple email addresses — similar to major email platforms. This project is deployable to Cloudflare Workers, reducing server costs while giving you full control over your own email service.

## 🖼️ Screenshots

- [Live Demo](https://skymail.ink)  
- [Deployment Docs](https://doc.skymail.ink)

| ![](/doc/demo/demo1.png) | ![](/doc/demo/demo2.png) |
|---|---|
| ![](/doc/demo/demo3.png) | ![](/doc/demo/demo4.png) |

## ✨ Features

- **💰 Low Cost** — Deploys on Cloudflare Workers, drastically reducing server expenses.
- **💻 Responsive Design** — Adaptive layout works on both desktop and mobile browsers.
- **📧 Email Sending** — Integrated with Resend for sending, bulk mail, inline images, attachments, and delivery status tracking.
- **🛡️ Admin Panel** — Manage users and emails with RBAC (Role-Based Access Control) for fine-grained permissions and resource limits.
- **📦 Attachment Support** — Send and receive attachments stored on Cloudflare R2.
- **🔔 Push Notifications** — Forward incoming emails to Telegram bots or other email providers.
- **📡 Open API** — Batch-create users and query emails with multiple filters via the REST API.
- **📈 Data Visualization** — System usage stats and email growth visualized with ECharts.
- **🎨 Customization** — Customize site title, login background, and transparency settings.
- **🤖 CAPTCHA** — Integrated Turnstile human verification to prevent bot registrations.
- **📜 More Features** — Work in progress...

## 🛠️ Tech Stack

| Category        | Technology                                      |
|-----------------|-------------------------------------------------|
| Platform        | [Cloudflare Workers](https://workers.cloudflare.com/) |
| Web Framework   | [Hono](https://hono.dev/)                      |
| ORM             | [Drizzle](https://orm.drizzle.team/)           |
| Frontend        | [Vue 3](https://vuejs.org/)                    |
| UI Library      | [Element Plus](https://element-plus.org/)      |
| Email Delivery  | [Resend](https://resend.com/)                  |
| Cache           | [Cloudflare KV](https://developers.cloudflare.com/kv/) |
| Database        | [Cloudflare D1](https://developers.cloudflare.com/d1/) |
| File Storage    | [Cloudflare R2](https://developers.cloudflare.com/r2/) |

## 📁 Project Structure

```
cloud-mail
├── mail-worker                   # Worker backend
│   ├── src                  
│   │   ├── api                   # API routes
│   │   ├── const                 # Constants
│   │   ├── dao                   # Data access layer
│   │   ├── email                 # Email processing & receiving
│   │   ├── entity                # Database entities
│   │   ├── error                 # Custom exceptions
│   │   ├── hono                  # Hono config, middleware, error handling
│   │   ├── i18n                  # Internationalization
│   │   ├── init                  # Database & cache initialization
│   │   ├── model                 # Response models
│   │   ├── security              # Authentication & authorization
│   │   ├── service               # Business logic layer
│   │   ├── template              # Message templates
│   │   ├── utils                 # Utility functions
│   │   └── index.js              # Entry point
│   ├── package.json              # Dependencies
│   └── wrangler.toml             # Wrangler configuration
│
├── mail-vue                      # Vue frontend
│   ├── src
│   │   ├── axios                 # Axios config
│   │   ├── components            # Custom components
│   │   ├── echarts               # ECharts imports
│   │   ├── i18n                  # Internationalization
│   │   ├── init                  # Client initialization
│   │   ├── layout                # Layout components
│   │   ├── perm                  # Permission helpers
│   │   ├── request               # API request layer
│   │   ├── router                # Route config
│   │   ├── store                 # Pinia global state
│   │   ├── utils                 # Utility functions
│   │   ├── views                 # Page components
│   │   ├── app.vue               # Root component
│   │   ├── main.js               # Entry JS
│   │   └── style.css             # Global styles
│   ├── package.json              # Dependencies
│   └── env.release               # Environment config
```

## 🚀 Getting Started (Local Development)

### Prerequisites
- Node.js 18+
- pnpm
- Cloudflare account (for production deployment)

### Setup

```bash
# 1. Clone the repository
git clone https://github.com/andrizpray/cloud-mail.git
cd cloud-mail

# 2. Install backend dependencies
cd mail-worker
pnpm install

# 3. Install frontend dependencies
cd ../mail-vue
pnpm install

# 4. Configure environment
#    Edit mail-vue/.env.dev with your settings
cp mail-vue/.env.release mail-vue/.env.dev
```

### Running Locally

```bash
# Terminal 1: Start the frontend dev server
cd mail-vue
pnpm run dev

# Terminal 2: Start the worker dev server
cd mail-worker
npx wrangler dev --config wrangler-dev.toml --local --persist

# Terminal 3: Initialize the database
curl "http://127.0.0.1:8787/api/init/YOUR_INIT_SECRET"
```

> The init secret is defined in `wrangler-dev.toml` under `vars.jwt_secret`.

### Default Admin Login
- Email: `admin@example.com`
- Password: `test123`

## ☁️ Deployment to Cloudflare

```bash
cd mail-worker

# 1. Set up D1 database, KV namespace, R2 bucket
#    (via Cloudflare Dashboard or Wrangler CLI)

# 2. Configure wrangler.toml with your IDs

# 3. Deploy
npx wrangler deploy

# 4. Initialize the database in production
curl "https://your-worker.workers.dev/api/init/YOUR_INIT_SECRET"
```

## 🤝 Sponsorship

<a href="https://doc.skymail.ink/support.html">
<img width="170px" src="./doc/images/support.png" alt="Sponsor">
</a>

## 📄 License

This project is licensed under the [MIT](LICENSE) license.

## 💬 Community

- [Telegram Group](https://t.me/cloud_mail_tg)
- Upstream project: [maillab/cloud-mail](https://github.com/maillab/cloud-mail)
