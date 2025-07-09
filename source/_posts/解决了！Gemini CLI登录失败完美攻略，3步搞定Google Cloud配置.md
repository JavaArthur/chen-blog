---
title: 解决了！Gemini CLI登录失败完美攻略，3步搞定Google Cloud配置
date: 2024-12-01 11:00:00
tags: [Gemini, CLI, Google Cloud, 教程]
categories: [技术教程]
---

# 解决了！Gemini CLI登录失败完美攻略，3步搞定Google Cloud配置

![](https://fastly.jsdelivr.net/gh/bucketio/img6@main/2025/06/26/1750907966648-913258e3-7996-4d62-a936-209927b272fe.png)

详细报错信息
```
│ Failed to login. Workspace accounts and licensed Code Assist users must configure GOOGLE_CLOUD_PROJECT (see 
││ https://goo.gle/gemini-cli-auth-docs#workspace-gca).                          ││ Message: Request contains an invalid argument.
```

简单来说，**问题根源在于 `gemini-cli` 是一个面向开发者的命令行工具，它需要通过 Google Cloud (谷歌云) 的框架来进行认证和管理API用量，即使你使用的是个人账号。**

下面我将为你详细解释原因，并提供一步步的解决方案。

## 为什么个人账号也需要配置 `GOOGLE_CLOUD_PROJECT`？

1. **API 使用需要项目来管理**：当你通过 `gemini-cli` 或任何程序代码来调用 Gemini API 时，Google 需要一个地方来追踪你的 API 请求次数、管理权限和（如果用量超出免费额度）进行计费。这个“地方”就是 **Google Cloud Project (谷歌云项目)**。它就像一个容器，把你使用的云资源（比如 Gemini API）都装在里面。
    
2. **个人账号 vs. 开发者身份**：虽然你用的是个人Gmail邮箱登录，但当你开始使用 API 和命令行工具时，你的身份就从一个普通用户转变成了“开发者”。对于开发者，Google 要求使用 Google Cloud Project 来规范化地管理服务。
    
3. **报错信息的含义**：`Workspace accounts and licensed Code Assist users must configure GOOGLE_CLOUD_PROJECT` 这个信息虽然主要提到了 Workspace 账号（企业/学校账号）和 Code Assist 用户，但其底层的认证机制是统一的。**它实际上是在告诉你：“我检测到你想通过开发者工具（CLI）来访问我，请告诉我你的 API 请求应该记录在哪个 Google Cloud 项目下。”**

## 解决方案：三步设置你的 Google Cloud 项目

别担心，为个人账号设置这个非常简单，而且在免费额度内使用 Gemini API 是**免费**的。

### 第 1 步：创建或选择一个 Google Cloud 项目

你需要先有一个 Google Cloud Project。

1. **登录 Google Cloud 控制台**： 打开浏览器，访问 [https://console.cloud.google.com/](https://console.cloud.google.com/)。请使用你登录 `gemini-cli` 时用的同一个 Google 账号。
    
2. **创建新项目**（如果你从来没用过 Google Cloud）：
    
    - 在页面顶部，点击项目选择器（可能显示 "Select a project" 或一个已有的项目名称）。
    - 在弹出的对话框中，点击 **"NEW PROJECT"**。
    - 给你的项目起一个名字，比如 `my-gemini-cli-project`，然后点击 **"CREATE"**。
3. **获取你的项目 ID (Project ID)**：
    
    - 创建成功后，确保顶部的项目选择器选中了你刚刚创建的项目。
    - 项目名称旁边会有一个 **ID**，通常格式是 `your-project-name-123456`。**这个 ID 非常重要，请复制下来。**

![](https://fastly.jsdelivr.net/gh/bucketio/img6@main/2025/06/26/1750907521529-986595b9-1bd9-443b-8782-4ca3c54dda2d.png)

### 第 2 步：为项目启用 Gemini API (Vertex AI API)


光有项目还不够，你需要在项目里“打开”Gemini API 的开关。

1. **导航到 API 库**： 确保你还在刚才选中的项目里，然后访问以下链接直接进入 Vertex AI API 的启用页面： [https://console.cloud.google.com/apis/library/vertexai.googleapis.com](https://www.google.com/search?q=https://console.cloud.google.com/apis/library/vertexai.googleapis.com)

![](https://fastly.jsdelivr.net/gh/bucketio/img9@main/2025/06/26/1750907503933-5d42c604-e5fc-4915-a5b4-1033635d042f.png)

    
2. **启用 API**： 点击蓝色的 **"Enable"** 按钮。等待几秒钟让它处理完毕。
    
    _注意：如果这是你第一次在 Google Cloud 中启用需要结算的 API，系统可能会提示你关联一个**结算账号 (Billing Account)**。别担心，Gemini API 有非常慷慨的免费额度，只要你不疯狂使用，就不会产生费用。你需要按照提示绑定一张信用卡，但不会被扣费。这是 Google Cloud 激活大多数 API 的标准流程。_


![](https://fastly.jsdelivr.net/gh/bucketio/img16@main/2025/06/26/1750907483802-3cf3b120-58b0-4af7-9226-01c91c4db6d1.png)



### 第 3 步：在你的终端（命令行）中配置项目

现在，回到你运行 `gemini-cli` 的终端，执行报错信息提示的命令。

1. **运行配置命令**： 将下面命令中的 `YOUR_PROJECT_ID` 替换成你在第 1 步中复制的**项目 ID**。
    
    例如，如果你的项目 ID 是 `my-gemini-cli-project-123456`，你应该运行：
    
    这个命令是使用 `gcloud`（Google Cloud 的官方命令行工具）来为你当前的开发环境设置一个默认项目。`gemini-cli` 会读取这个配置。
    
2. **备用方案：设置环境变量** (如果上一步无效或不想安装 `gcloud`) 你也可以通过设置环境变量来告诉 `gemini-cli` 你的项目 ID。
    
    - 在 macOS 或 Linux 上:
    - 在 Windows (Command Prompt) 上:
    - 在 Windows (PowerShell) 上:
    
    _注意：通过 `export` 或 `set` 设置的环境变量只在当前的终端会话中有效。关闭窗口后需要重新设置。_
3. **Mac配置环境变量**
	 a. 你需要使用文本编辑器来修改环境变量配置文件，以 Zsh 为例：
	 ```
     open ~/.zshrc 
     ```
	 b. 在打开的文件末尾添加如下内容：
	 ```
     export GOOGLE_CLOUD_PROJECT="YOUR_PROJECT_ID" 
     ```
	c. 保存文件后，关闭并重新打开终端，或者执行以下命令让配置立即生效：
	``` 
    source ~/.zshrc  # 如果你使用的是 Zsh 
    ```
	d. 验证环境变量是否设置成功
    ```
    echo $GOOGLE_CLOUD_PROJECT
    ```

---

### 最后一步：重新登录

完成以上所有步骤后，再次运行 `gemini-cli` 的登录命令：


## 启动成功
问了下天气，调用了google-search
![[Pasted image 20250626101011.png]]
## 总结 

1. 登录 [Google Cloud 控制台](https://console.cloud.google.com/)。
2. 创建一个新项目，并**复制你的项目 ID (Project ID)**。
3. 在项目中[启用 Vertex AI API](https://www.google.com/search?q=https://console.cloud.google.com/apis/library/vertexai.googleapis.com) (可能需要绑定结算信息，但有免费额度)。
4. 在你的电脑终端里运行 `gcloud config set core/project YOUR_PROJECT_ID` (将 `YOUR_PROJECT_ID` 替换为你的真实 ID)。
5. 重新运行 `gemini login`。