---
title: 🚀 飞书 MCP 实战：从 Bot 创建到文档生成全流程详解
date: 2025-07-13 12:00:00
tags: [飞书, MCP, Bot开发, 文档自动化, 实战教程]
categories: [技术教程]
permalink: feishu-mcp-bot-tutorial/
cover: false
---
## 飞书 MCP 实战：从 Bot 创建到文档生成全流程详解​
> 本文将详细介绍飞书 MCP 的完整实现流程，从零开始创建飞书 Bot，获取必要参数，配置 MCP 服务器，到最终实现文档自动生成功能。通过实战演示，帮助开发者快速掌握飞书开放平台的核心应用技巧。

### 一、飞书 bot 创建步骤

1. **进入飞书开放平台**

首先，打开飞书开放平台的官方网址：[https://open.feishu.cn/app](https://open.feishu.cn/app)，进入平台首页。

![飞书开放平台首页界面](/images/2025/07/17/_E9_A3_9E_E4_B9_A6_E5_B9_B3_E5_8F_B0_E9_A1_B5_E9_9D_A220250711144339.png)

2. **创建企业自建应用**

在飞书开放平台首页，找到并点击 "创建企业自建应用" 选项，进入应用创建流程。

![点击创建企业自建应用按钮](/images/2025/07/17/_E7_82_B9_E5_87_BB_E5_88_9B_E5_BB_BA20250711144412.png)

3. **添加应用能力**

根据实际的业务场景需求，为即将创建的机器人添加对应的应用能力。完成添加后，页面中会出现机器人的专属 tab。

![机器人应用能力配置页面](/images/2025/07/17/_E6_9C_BA_E5_99_A8_E4_BA_BA20250711144450.png)

4. **添加相关权限**

点击进入权限设置相关界面，此时会弹出一个新的 tab。

![权限管理设置界面](/images/2025/07/17/_E6_9D_83_E9_99_90_E7_AE_A1_E7_90_8620250711144555.png)

在应用身份权限设置中，添加 "消息与群组""云文档""多维表格" 这几项权限。

![添加应用身份权限设置](/images/2025/07/17/_E6_B7_BB_E5_8A_A0_E6_9D_83_E9_99_9020250711144636.png)

同时，在用户身份权限设置里，也同样添加 "消息与群组""云文档""多维表格" 权限。

![用户身份权限配置界面](/images/2025/07/17/_E7_94_A8_E6_88_B7_E8_BA_AB_E4_BB_BD_E6_9D_83_E9_99_9020250711144811.png)

添加完成后，点击【确认开通权限】。

5. **创建并发布版本**

勾选完所需权限之后，页面顶部会提示【创建版本】，点击进入版本创建页面。

![创建版本提示页面](/images/2025/07/17/_E5_88_9B_E5_BB_BA_E7_89_88_E6_9C_AC20250711144918.png)

按照要求填写版本相关信息，填写完成后点击保存，此时会弹出是否要发布的弹窗。

![版本发布确认弹窗](/images/2025/07/17/_E5_8F_91_E5_B8_83_E5_BC_B9_E7_AA_9720250711145032.png)

若是个人版应用，可直接进行免审发布。

![应用发布成功页面](/images/2025/07/17/_E5_B7_B2_E5_8F_91_E5_B8_8320250711145105.png)

### 二、获取相关参数

1. **获取 App ID 和 App Secret**

在应用相关设置页面中，找到 App ID 和 App Secret，将其复制保存下来，后续配置 mcp 时会用到。

![应用凭证信息页面](/images/2025/07/17/_E5_87_AD_E8_AF_8120250711145201.png)

2. **获取 token**

打开获取 token 的页面（网址：[https://open.feish](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[u.cn/](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[docum](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[ent/s](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[erver](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[-docs](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[/docs](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[/docs](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[/docx](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[-v1/d](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[ocume](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[nt/cr](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)[eate](https://open.feishu.cn/document/server-docs/docs/docs/docx-v1/document/create)），点击页面中的 "获取 token" 选项，会弹出授权弹窗。

![点击获取token按钮](/images/2025/07/17/_E7_82_B9_E5_87_BBtoken20250711145511.png)

点击【授权】完成授权操作。

![token授权确认弹窗](/images/2025/07/17/_E6_8E_88_E6_9D_8320250711145535.png)

授权完成返回后，在调试台上会出现一串英文字符，这就是所需的 token，将其复制保存。

![获取到的token显示界面](/images/2025/07/17/toemn20250711145659.png)

### 三、配置飞书 MCP

1. **配置 json 文件**

飞书 mcp-server 的 json 配置如下：

```
{
    "mcpServers": {
        "feishu-mcp": {
            "command": "npx",
            "args": [
                "-y",
                "feishu-mcp",
                "--stdio"
            ],
            "env": {
                "FEISHU_APP_ID": "appid",
                "FEISHU_APP_SECRET": "app_secret"
            }
        }
    }
}
```

2. **导入配置并启动**

将刚才配置好的 json 文件导入，然后启动 lark-mcp。启动后可查看 tools 列表。

![飞书MCP工具列表界面](/images/2025/07/17/feishu-mcp-tools20250711154206.png)

### 四、实战操作

1. **创建飞书文档**

进行实战操作时，首先创建飞书文档。

![创建飞书文档操作界面](/images/2025/07/17/_E5_88_9B_E5_BB_BA_E9_A3_9E_E4_B9_A6_E6_96_87_E6_A1_A320250711162858.png)

2. **查看文档效果**

点击文档链接，即可查看创建好的文档，从实际效果来看，文档呈现效果良好。

![生成的飞书文档最终效果](/images/2025/07/17/_E6_96_87_E6_A1_A3_E5_9C_B0_E5_9D_8020250711162949.png)



---

### 总结

通过本文的实战演示，我们完成了飞书 MCP 从零到一的完整搭建流程。飞书 MCP 不仅能自动生成文档，还可以扩展到报告生成、数据处理、表格操作等更多办公场景。

### 动手试试吧

看完教程，不如亲自动手实践一下：

1. 创建你的第一个飞书 Bot
2. 配置 MCP 服务器  
3. 生成你的第一份自动化文档

遇到问题欢迎在评论区交流讨论，如果文章对你有帮助，记得点赞收藏支持！

期待看到大家的实践成果和创新应用。