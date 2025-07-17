---
title: 🤖 AI助手直接操作你的知识库！MCP与Obsidian完美集成7步教程
date: 2025-07-15 15:49:16
tags: [MCP, Obsidian, AI助手, 知识管理, 自动化]
categories: [技术教程]
permalink: mcp-obsidian-integration-tutorial/
cover: false
---

# AI助手直接操作你的知识库！MCP与Obsidian完美集成7步教程

## 简介

Model Context Protocol (MCP) 是一种强大的协议，能够让AI助手直接与本地应用程序交互。通过将MCP与Obsidian集成，您可以让AI助手直接访问、管理和操作您的知识库，极大地提升工作效率。本文将详细介绍如何实现这一集成。

## 前置准备

- 已安装的Obsidian应用
- 一个已创建的Obsidian知识库
- MCP客户端（如ChatWise等）

## 集成步骤

### 步骤一：安装Local REST API插件

1. 打开Obsidian，进入【第三方插件】→【社区插件市场】
2. 在搜索框中输入「Local REST」
   ![Local REST插件搜索](/images/2025/07/17/20250715140416.png)
3. 找到并安装「Local REST API」插件

### 步骤二：配置API访问

1. 安装完成后，系统会自动生成一个API Key
   ![API Key生成](/images/2025/07/17/20250715140312.png)
2. 请妥善保存此API Key，它是访问您Obsidian库的凭证

### 步骤三：激活API服务

1. 访问API文档页面：[https://coddingtonbear.github.io/obsidian-local-rest-api/](https://coddingtonbear.github.io/obsidian-local-rest-api/)
   ![API文档页面](/images/2025/07/17/20250715140510.png)
2. 点击页面右下角的「Authorize」按钮
3. 输入之前获取的API Key
4. 确认授权，完成API服务激活

### 步骤四：获取Obsidian知识库路径

在进行MCP集成前，您需要获取并复制Obsidian知识库的本地路径。

### 步骤五：在MCP客户端中配置Obsidian集成

在ChatWise或其他支持MCP的客户端中，使用以下命令连接到您的Obsidian知识库：

```bash
uv tool run mcp-obsidian --vault-path <您的Obsidian知识库路径>

# 设置环境变量
OBSIDIAN_API_KEY=<您的API密钥>
```

### 步骤六：验证集成

配置完成后，您可以查看可用的工具列表，确认Obsidian工具已成功加载：
![工具列表](/images/2025/07/17/20250715140706.png)

## 步骤七：演示

![image.png](/images/2025/07/17/20250715141554.png)

## 功能亮点

成功集成后，您可以通过AI助手实现以下功能：

- 搜索和查询知识库内容
- 创建和编辑笔记
- 组织和管理知识结构
- 自动生成内容摘要
- 智能推荐相关笔记

>MCP Obsidian的源代码可以在GitHub上找到：
[https://github.com/smithery-ai/mcp-obsidian](https://github.com/smithery-ai/mcp-obsidian)

## 结语

通过MCP与Obsidian的集成，您的知识管理将迈入智能化新时代。AI助手能够直接与您的知识库交互，提供更加高效、智能的辅助功能，让知识管理和创作过程更加流畅自然。

---

> 注：本教程基于当前版本的Obsidian和MCP协议，未来版本可能会有所变化，请以最新官方文档为准。
