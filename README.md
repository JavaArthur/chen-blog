# 🌟 Chen's Blog

> 一个基于 Hexo + Butterfly 主题的个人技术博客，专注于 AI、技术教程和工具分享。

[![Vercel](https://img.shields.io/badge/Deployed%20on-Vercel-black?style=flat&logo=vercel)](https://chen-blog-sigma.vercel.app)
[![Hexo](https://img.shields.io/badge/Hexo-7.3.0-blue?style=flat&logo=hexo)](https://hexo.io/)
[![Butterfly](https://img.shields.io/badge/Theme-Butterfly-pink?style=flat)](https://github.com/jerryc127/hexo-theme-butterfly)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat)](LICENSE)

## 🚀 在线访问

- **主站**：[https://chen-blog-sigma.vercel.app](https://chen-blog-sigma.vercel.app)
- **备用域名**：[https://your-custom-domain.com](https://your-custom-domain.com)

## 📖 博客特色

- 🎨 **现代化设计**：基于 Butterfly 主题，响应式布局
- ⚡ **快速加载**：Vercel CDN 全球加速
- 🔍 **搜索功能**：支持全文搜索
- 📱 **移动友好**：完美适配各种设备
- 🌙 **暗黑模式**：支持明暗主题切换
- 📊 **数据统计**：访问量统计和字数统计

## 🛠️ 技术栈

- **静态站点生成器**：[Hexo 7.3.0](https://hexo.io/)
- **主题**：[Butterfly 5.4.1](https://github.com/jerryc127/hexo-theme-butterfly)
- **部署平台**：[Vercel](https://vercel.com/)
- **图片存储**：本地存储 + Vercel CDN
- **搜索引擎**：hexo-generator-searchdb
- **RSS 订阅**：hexo-generator-feed

## 📝 主要内容

### 🤖 AI 工具与技术
- AI 编程助手使用指南
- 大语言模型应用实践
- AI 工具评测与推荐

### 💻 技术教程
- 开发环境配置
- 工具使用指南
- 问题解决方案

### 🔧 实用工具
- 图床配置教程
- 博客部署指南
- 效率工具推荐

## 🏗️ 项目结构

```
chen-blog/
├── source/                 # 源文件目录
│   ├── _posts/            # 博客文章
│   ├── images/            # 图片资源
│   │   ├── covers/        # 文章封面
│   │   ├── posts/         # 文章图片
│   │   ├── branding/      # 品牌图片
│   │   └── backgrounds/   # 背景图片
│   ├── about/             # 关于页面
│   └── tags/              # 标签页面
├── themes/                # 主题目录
├── _config.yml           # Hexo 配置
├── _config.butterfly.yml # 主题配置
├── package.json          # 依赖配置
└── vercel.json           # Vercel 部署配置
```

## 🚀 本地开发

### 环境要求

- Node.js >= 14.0.0
- npm >= 6.0.0

### 快速开始

```bash
# 克隆项目
git clone https://github.com/JavaArthur/chen-blog.git
cd chen-blog

# 安装依赖
npm install

# 启动开发服务器
npm run server

# 访问 http://localhost:4000
```

### 常用命令

```bash
# 清理缓存
npm run clean

# 生成静态文件
npm run build

# 启动本地服务器
npm run server

# 新建文章
hexo new post "文章标题"

# 新建页面
hexo new page "页面名称"
```

## 📝 写作指南

### 文章格式

```yaml
---
title: 文章标题
date: 2024-01-01 12:00:00
tags: [标签1, 标签2]
categories: [分类]
cover: /images/covers/article-cover.jpg  # 可选
permalink: custom-url-slug/              # 可选
---

文章内容...
```

### 图片使用

```markdown
# 文章图片
![图片描述](/images/posts/article-name/image.jpg)

# 封面图片
cover: /images/covers/cover-image.jpg
```

### 推荐规范

- 使用英文文件名和 URL
- 图片大小控制在 200KB 以内
- 文章封面比例 16:9 (800×450px)
- 使用描述性的图片文件名

## 🎨 主题配置

主要配置文件：`_config.butterfly.yml`

### 关键配置项

```yaml
# 网站信息
site:
  name: Chen's Blog
  title: 晨启AI
  subtitle: 与AI同行，启发无限可能

# 导航菜单
nav:
  logo: /images/branding/logo.png
  
# 文章封面
cover:
  index_enable: true
  default_cover:
    - /images/covers/default-1.jpg
    - /images/covers/default-2.jpg
```

## 🚀 部署说明

### Vercel 部署

项目已配置自动部署：

1. 推送代码到 GitHub
2. Vercel 自动检测并部署
3. 访问生成的 URL

### 部署配置

`vercel.json` 配置：

```json
{
  "build": {
    "env": {
      "TZ": "Asia/Shanghai"
    }
  },
  "buildCommand": "npm run build",
  "outputDirectory": "public",
  "installCommand": "npm install",
  "framework": null
}
```

## 📊 SEO 优化

- ✅ 自定义 URL 结构
- ✅ Meta 标签优化
- ✅ 站点地图生成
- ✅ RSS 订阅支持
- ✅ 搜索引擎友好

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 📞 联系方式

- **作者**：Channing
- **邮箱**：xiekc0930@gmail.com
- **GitHub**：[@JavaArthur](https://github.com/JavaArthur)
- **博客**：[https://chen-blog-sigma.vercel.app](https://chen-blog-sigma.vercel.app)

## 🙏 致谢

- [Hexo](https://hexo.io/) - 强大的静态站点生成器
- [Butterfly](https://github.com/jerryc127/hexo-theme-butterfly) - 优雅的 Hexo 主题
- [Vercel](https://vercel.com/) - 优秀的部署平台

---

⭐ 如果这个项目对你有帮助，请给个 Star 支持一下！
