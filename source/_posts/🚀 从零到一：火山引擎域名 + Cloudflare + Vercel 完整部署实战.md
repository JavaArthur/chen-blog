

> 作为一名开发者，你是否遇到过域名配置的各种坑？今天分享一套完整的域名部署方案，让你的项目快速上线！

![image.png](/images/2025/07/12/cover20250712001213.png)

## 📋 方案概述

**技术栈组合：**
- 🏷️ **域名注册**：火山引擎（国内备案友好）
- 🛡️ **DNS + CDN**：Cloudflare（免费SSL + 全球加速）
- 🚀 **部署平台**：Vercel（自动部署 + 边缘计算）

**优势分析：**
- ✅ 成本低廉（大部分服务免费）
- ✅ 性能优异（全球CDN加速）
- ✅ 配置简单（图形化操作）
- ✅ 自动化部署（Git推送即部署）

## 🎯 实战配置流程

### Step 1: Cloudflare账号准备

```bash
# 访问官网注册
https://cloudflare.com

# 添加站点
Dashboard → Add a Site → 输入域名
```

**关键点：** 选择Free Plan即可满足个人开发需求

### Step 2: DNS服务器迁移

#### 🔧 Cloudflare端操作

添加域名后，Cloudflare会提供两个NS服务器：

```
示例：
alice.ns.cloudflare.com
bob.ns.cloudflare.com
```

#### 🔧 火山引擎端操作

```bash
控制台路径：域名服务 → 域名管理 → 选择域名 → 管理

操作：修改DNS服务器
原值：火山引擎默认DNS
新值：Cloudflare提供的NS地址
```

**⏰ 生效时间：** 1-24小时（通常4小时内）

### Step 3: DNS记录配置

等NS生效后，在Cloudflare添加基础记录：

```bash
# 主域名记录
类型: A
名称: @
IPv4: 76.76.19.19
代理: 开启 🟠

# WWW记录  
类型: A
名称: www
IPv4: 76.76.19.19
代理: 开启 🟠
```

### Step 4: Vercel项目绑定

#### 🎯 单个项目配置

```bash
Vercel Dashboard → Project → Settings → Domains

添加域名：blog.yourdomain.com
```

Vercel会返回CNAME信息：
```
目标值: cname.vercel-dns.com
```

#### 🎯 Cloudflare对应配置

```bash
类型: CNAME
名称: blog
目标: cname.vercel-dns.com  
代理: 开启 🟠
```

## 🌟 进阶配置：多项目管理

### 二级域名规划

```bash
# 项目分类配置
blog.domain.com     → 个人博客
api.domain.com      → 后端API
admin.domain.com    → 管理后台
docs.domain.com     → 技术文档
dev.domain.com      → 测试环境
```

### 通配符域名配置

**适用场景：** 多租户SaaS应用

```bash
# Vercel配置
域名: *.yourdomain.com

# Cloudflare配置
类型: A
名称: *
IPv4: 76.76.19.19
代理: 开启
```

## ⚡ 性能优化配置

### SSL/TLS增强

```bash
Cloudflare → SSL/TLS → 概述
加密模式: 完全(严格)

# 启用附加功能
- Always Use HTTPS: 开启
- HTTP Strict Transport Security: 开启  
- Minimum TLS Version: 1.2
```

### 缓存策略优化

```bash
# 静态资源缓存规则
Page Rules → Create Page Rule

URL: *.yourdomain.com/static/*
Settings: Cache Level = Cache Everything
Edge Cache TTL: 1 month
```

## 🔍 验证与测试

### DNS生效检查

```bash
# 命令行验证
nslookup yourdomain.com
dig yourdomain.com

# 在线工具
https://www.whatsmydns.net/
```

### 性能测试

```bash
# 响应时间测试
curl -w "@curl-format.txt" -o /dev/null -s https://yourdomain.com

# SSL证书检查
openssl s_client -connect yourdomain.com:443
```

## 🚨 常见问题解决

### 问题1：NS生效慢

**现象：** 修改NS后长时间无法访问

**解决方案：**
```bash
# 检查NS是否生效
dig NS yourdomain.com

# 清除本地DNS缓存
# Windows
ipconfig /flushdns

# macOS  
sudo dscacheutil -flushcache
```

### 问题2：SSL证书错误

**现象：** 浏览器显示证书不安全

**解决方案：**
1. 确认Cloudflare SSL模式为"完全(严格)"
2. 等待证书自动生成（通常15分钟）
3. 检查Vercel项目SSL状态

### 问题3：国内访问慢

**现象：** 国内用户访问速度慢

**优化方案：**
```bash
# Cloudflare优化
- 启用中国网络优化
- 配置Page Rules缓存
- 使用Argo Smart Routing（付费）
```

## 📊 成本与收益分析

| 服务 | 免费额度 | 付费升级 | 适用场景 |
|------|----------|----------|----------|
| 火山引擎域名 | - | ¥55/年 | 个人项目 |
| Cloudflare | 100%免费 | $20/月 | 中小企业 |
| Vercel | 100GB带宽 | $20/月 | 个人开发者 |

**总成本：** 约¥55/年（仅域名费用）

## 🎉 总结

这套方案的核心优势：

1. **🔥 零学习成本**：全图形化界面操作
2. **⚡ 极致性能**：全球CDN + 边缘计算
3. **💰 成本控制**：大部分服务免费使用
4. **🛠️ 易于维护**：自动化部署和SSL管理

**适用人群：**
- 个人开发者
- 初创团队  
- 技术博主
- 开源项目维护者

---

**💡 上期博客部署文章：** 🦋 [Hexo + Butterfly + Vercel 完整部署指南](https://blog.aichanning.cn/hexo-butterfly-vercel-deploy-guide/)

> 觉得有用的话，点个赞👍 + 收藏⭐，让更多开发者看到这篇实战指南！

**🔗 相关链接：**
- [Cloudflare官网](https://cloudflare.com)
- [Vercel官网](https://vercel.com)  
- [火山引擎域名服务](https://console.volcengine.com/domain/)