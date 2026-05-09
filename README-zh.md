<p align="center">
    <img src="doc/demo/logo.png" width="80px" />
    <h1 align="center">Cloud Mail</h1>
    <p align="center">基于 Cloudflare 的简约响应式邮箱服务，支持邮件发送、附件收发 🎉</p> 
    <p align="center">
        <a href="README.md">English</a> | <a href="README-zh.md" style="margin-left: 5px">简体中文</a>
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

> **Fork 自 [maillab/cloud-mail](https://github.com/maillab/cloud-mail).**  
> 本 fork 由 [andrizpray](https://github.com/andrizpray) 定制维护。

---

## 项目简介

只需要一个域名，就可以创建多个不同的邮箱，类似各大邮箱平台。本项目可部署到 Cloudflare Workers，降低服务器成本，搭建自己的邮箱服务。

## 项目展示

- [在线演示](https://skymail.ink)
- [部署文档](https://doc.skymail.ink)

| ![](/doc/demo/demo1.png) | ![](/doc/demo/demo2.png) |
|---|---|
| ![](/doc/demo/demo3.png) | ![](/doc/demo/demo4.png) |

## 功能介绍

- **💰 低成本使用**：可部署到 Cloudflare Workers，降低服务器成本
- **💻 响应式设计**：响应式布局自动适配 PC 和大部分手机端浏览器
- **📧 邮件发送**：集成 Resend 发送邮件，支持群发、内嵌图片和附件发送、发送状态查看
- **🛡️ 管理员功能**：可以对用户、邮件进行管理，RBAC 权限控制及资源限制
- **📦 附件收发**：支持收发附件，使用 R2 对象存储保存和下载文件
- **🔔 邮件推送**：接收邮件后可转发到 TG 机器人或其他服务商邮箱
- **📡 开放 API**：支持使用 API 批量生成用户、多条件查询邮件
- **📈 数据可视化**：使用 ECharts 对系统数据详情和用户邮件增长进行可视化显示
- **🎨 个性化设置**：可自定义网站标题、登录背景、透明度
- **🤖 人机验证**：集成 Turnstile 人机验证，防止批量注册
- **📜 更多功能**：正在开发中...

## 技术栈

| 类别      | 技术                                                  |
|-----------|-------------------------------------------------------|
| 平台      | [Cloudflare Workers](https://workers.cloudflare.com/) |
| Web 框架  | [Hono](https://hono.dev/)                            |
| ORM       | [Drizzle](https://orm.drizzle.team/)                 |
| 前端框架  | [Vue 3](https://vuejs.org/)                          |
| UI 框架   | [Element Plus](https://element-plus.org/)            |
| 邮件服务  | [Resend](https://resend.com/)                        |
| 缓存      | [Cloudflare KV](https://developers.cloudflare.com/kv/) |
| 数据库    | [Cloudflare D1](https://developers.cloudflare.com/d1/) |
| 文件存储  | [Cloudflare R2](https://developers.cloudflare.com/r2/) |

## 目录结构

```
cloud-mail
├── mail-worker                   # Worker 后端项目
│   ├── src
│   │   ├── api                   # API 接口层
│   │   ├── const                 # 项目常量
│   │   ├── dao                   # 数据访问层
│   │   ├── email                 # 邮件处理接收
│   │   ├── entity                # 数据库实体
│   │   ├── error                 # 自定义异常
│   │   ├── hono                  # Web 框架配置、拦截器、全局异常等
│   │   ├── i18n                  # 语言国际化
│   │   ├── init                  # 数据库缓存初始化
│   │   ├── model                 # 响应体数据封装
│   │   ├── security              # 身份权限认证
│   │   ├── service               # 业务服务层
│   │   ├── template              # 消息模板
│   │   ├── utils                 # 工具类
│   │   └── index.js              # 入口文件
│   ├── package.json              # 项目依赖
│   └── wrangler.toml             # 项目配置
│
├── mail-vue                      # Vue 前端项目
│   ├── src
│   │   ├── axios                 # Axios 配置
│   │   ├── components            # 自定义组件
│   │   ├── echarts               # ECharts 组件导入
│   │   ├── i18n                  # 语言国际化
│   │   ├── init                  # 入站初始化
│   │   ├── layout                # 主体布局组件
│   │   ├── perm                  # 权限认证
│   │   ├── request               # API 接口层
│   │   ├── router                # 路由配置
│   │   ├── store                 # 全局状态管理
│   │   ├── utils                 # 工具类
│   │   ├── views                 # 页面组件
│   │   ├── app.vue               # 入口组件
│   │   ├── main.js               # 入口 JS
│   │   └── style.css             # 全局 CSS
│   ├── package.json              # 项目依赖
│   └── env.release               # 项目配置
```

## 本地开发

### 前提条件
- Node.js 18+
- pnpm
- Cloudflare 账号（用于生产部署）

### 安装

```bash
# 1. 克隆仓库
git clone https://github.com/andrizpray/cloud-mail.git
cd cloud-mail

# 2. 安装后端依赖
cd mail-worker
pnpm install

# 3. 安装前端依赖
cd ../mail-vue
pnpm install

# 4. 配置环境变量
#    编辑 mail-vue/.env.dev
cp mail-vue/.env.release mail-vue/.env.dev
```

### 本地运行

```bash
# 终端 1: 启动前端开发服务器
cd mail-vue
pnpm run dev

# 终端 2: 启动 Worker 开发服务器
cd mail-worker
npx wrangler dev --config wrangler-dev.toml --local --persist

# 终端 3: 初始化数据库
curl "http://127.0.0.1:8787/api/init/YOUR_INIT_SECRET"
```

> 初始化密钥定义在 `wrangler-dev.toml` 的 `vars.jwt_secret` 中。

### 默认管理员登录
- 邮箱: `admin@example.com`
- 密码: `test123`

## ☁️ 生产部署

```bash
cd mail-worker

# 1. 创建 D1 数据库、KV 命名空间、R2 存储桶
#    （通过 Cloudflare Dashboard 或 Wrangler CLI）

# 2. 配置 wrangler.toml

# 3. 部署
npx wrangler deploy

# 4. 初始化生产数据库
curl "https://your-worker.workers.dev/api/init/YOUR_INIT_SECRET"
```

## 赞助

<a href="https://doc.skymail.ink/support.html">
<img width="170px" src="./doc/images/support.png" alt="赞助">
</a>

## 许可证

本项目采用 [MIT](LICENSE) 许可证。

## 交流

- [Telegram 群组](https://t.me/cloud_mail_tg)
- 上游项目: [maillab/cloud-mail](https://github.com/maillab/cloud-mail)
