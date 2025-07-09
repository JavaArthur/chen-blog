---
title: 🦋 Hexo + Butterfly + Vercel 完整部署指南
date: 2025-07-09 12:00:00 +08:00
tags:
  - Hexo
  - Vercel
  - Butterfly
categories:
  - 技术教程
---
## 🦋 Hexo + Butterfly + Vercel 完整部署指南

### **第一步：本地环境准备**

#### 1. 安装Node.js和Hexo
```bash
# 安装Hexo CLI
npm install -g hexo-cli

# 创建博客项目
hexo init my-blog
cd my-blog
npm install
```

#### 2. 安装Butterfly主题
```bash
# 方法一：npm安装（推荐）
npm install hexo-theme-butterfly

# 方法二：Git克隆
git clone -b master https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly
```

---

### **第二步：配置Butterfly主题**

#### 1. 修改站点配置 `_config.yml`
```yaml
# 基本信息
title: Your Blog Name
subtitle: ''
description: 'Your blog description'
keywords: 'blog,hexo,butterfly'
author: Your Name
language: zh-CN
timezone: 'Asia/Shanghai'

# URL配置
url: https://your-blog.vercel.app
permalink: :year/:month/:day/:title/

# 主题设置
theme: butterfly

# 部署配置
deploy:
  type: ''
```

#### 2. 创建主题配置文件
```bash
# 复制主题配置到根目录（推荐方式）
cp node_modules/hexo-theme-butterfly/_config.yml _config.butterfly.yml

# 或者如果是git克隆的主题
cp themes/butterfly/_config.yml _config.butterfly.yml
```

#### 3. 配置 `_config.butterfly.yml`（核心配置）
```yaml
# 导航菜单
menu:
  首页: / || fas fa-home
  归档: /archives/ || fas fa-archive
  标签: /tags/ || fas fa-tags
  分类: /categories/ || fas fa-folder-open
  关于: /about/ || fas fa-heart

# 代码高亮
highlight_theme: light #  light dark high_contrast
highlight_copy: true # 复制按钮
highlight_lang: true # 显示语言
highlight_shrink: false # 代码框展开

# 社交链接
social:
  fab fa-github: https://github.com/your-username || Github
  fas fa-envelope: mailto:your-email@example.com || Email

# 头像
avatar:
  img: https://your-avatar-url.jpg
  effect: false

# 网站背景
background: url(https://your-background-image.jpg)

# 打字效果
subtitle:
  enable: true
  effect: true
  source: false
  sub:
    - 欢迎来到我的博客
    - Welcome to my blog
    - 分享技术与生活

# 文章封面
cover:
  index_enable: true
  aside_enable: true
  archives_enable: true
  default_cover:
    - https://example.com/img/default1.jpg
    - https://example.com/img/default2.jpg

# 评论系统（推荐Giscus）
comments:
  use: Giscus
  text: true
  lazyload: false
  count: false
  card_post_count: false

giscus:
  repo: your-username/your-repo
  repo_id: your-repo-id
  category_id: your-category-id
  theme:
    light: light
    dark: dark
  option:
```

---

### **第三步：创建必要页面**

```bash
# 创建分类页面
hexo new page categories
# 编辑 source/categories/index.md
---
title: 分类
date: 2025-07-08
type: "categories"
---

# 创建标签页面
hexo new page tags
# 编辑 source/tags/index.md
---
title: 标签
date: 2025-07-08
type: "tags"
---

# 创建关于页面
hexo new page about
# 编辑 source/about/index.md
---
title: 关于
date: 2025-07-08
---

# 这里写关于你的介绍
```

---

### **第四步：创建第一篇文章**

```bash
hexo new post "我的第一篇博客"
```

编辑生成的文件：

```markdown
---
title: 我的第一篇博客
date: 2025-07-08 17:49:00
tags: 
  - 博客
  - Hexo
categories: 
  - 技术分享
cover: http://syi4w5o08.hn-bkt.clouddn.com/picgo/20250708230348.png
---

# 欢迎来到我的博客

这是我使用 Hexo + Butterfly 主题搭建的博客！

<!-- more -->

## 特色功能

- 🎨 美观的Butterfly主题
- 📱 响应式设计
- 🚀 快速加载
- 💬 评论系统
- 🔍 搜索功能
```

---

### **第五步：本地预览**

```bash
# 清理并生成
hexo clean && hexo generate

# 启动本地服务器
hexo server

#或者
hexo clean && hexo generate && hexo server
# 访问 http://localhost:4000 预览
```

---

### **第六步：部署到Vercel**

#### 1. 推送到GitHub
```bash
# 初始化Git（如果还没有）
git init
git add .
git commit -m "Initial commit"

# 推送到GitHub

git remote add origin https://github.com/your-username/your-blog.git
git branch -M main
git push -u origin main
```

#### 2. 连接Vercel
1. 访问 [vercel.com](https://vercel.com)
2. 使用GitHub账号登录
3. 点击 "New Project"
4. 选择你的博客仓库
5. 配置构建设置：
   ```
   Framework Preset: Other
   Build Command: npm run build
   Output Directory: public
   Install Command: npm install
   ```

#### 3. 添加构建脚本到 `package.json`
```json
{
  "scripts": {
    "build": "hexo clean && hexo generate",
    "dev": "hexo server"
  }
}
```

#### 4. 创建 `vercel.json`（可选优化）
```json
{
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/static-build"
    }
  ]
}
```

---

### **第七步：优化配置**

#### 1. 安装推荐插件
```bash
npm install hexo-generator-searchdb --save
npm install hexo-wordcount --save
npm install hexo-generator-feed --save
```

#### 2. 配置搜索功能
在 `_config.yml` 添加：
```yaml
search:
  path: search.xml
  field: post
  content: true
```

#### 3. 配置RSS
```yaml
feed:
  enable: true
  type: atom
  path: atom.xml
  limit: 20
```

---

### **🎯 写作工作流**

```bash
# 1. 创建新文章
hexo new post "文章标题"

# 2. 编辑文章
# 在 source/_posts/ 目录下编辑

# 3. 本地预览
hexo server

# 4. 推送发布
git add .
git commit -m "新增文章：文章标题"
git push

# Vercel会自动构建部署
```

### **🔧 常用命令**

```bash
hexo new [layout] <title>    # 新建文章
hexo generate               # 生成静态文件
hexo server                # 启动本地服务器
hexo deploy                # 部署网站
hexo clean                 # 清除缓存文件
```

