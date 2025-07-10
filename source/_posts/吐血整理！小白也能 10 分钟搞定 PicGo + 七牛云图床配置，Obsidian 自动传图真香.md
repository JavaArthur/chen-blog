---
title: 吐血整理！小白也能 10 分钟搞定 PicGo + 七牛云图床配置，Obsidian 自动传图真香
date: 2025-06-28 13:00:00
tags: [PicGo, 七牛云, Obsidian, 图床配置]
categories: [技术教程]
cover: /images/covers/Obsidian+七牛云.jpg
permalink: picgo-qiniu-obsidian-setup-guide/
---

# 吐血整理！小白也能 10 分钟搞定 PicGo + 七牛云图床配置，Obsidian 自动传图真香

写文章、记笔记时，图片上传总是个麻烦事儿？别愁了！今天手把手教你把 PicGo 图床和七牛云完美搭配，再联动 Obsidian 实现自动上传图片，效率直接拉满！

## 一、七牛云基础配置：三步拿到关键信息

### 1. 创建专属存储空间

打开七牛云官网，找到对象存储页面，点击 “新建存储空间” 按钮。取名字时注意别和别人重复，存储区域就选离你最近的，这样传图速度更快！访问控制建议直接选 “公开”，之后用起来更方便。填好信息点 “确定”，属于你的云空间就建好了！

![新建空间](http://syi4w5o08.hn-bkt.clouddn.com/picgo/20250627233847.png)

### 2. 获取密钥：PicGo 登录的 “钥匙”

点击右上角头像，进入 “密钥管理” 页面，就能看到 AccessKey 和 SecretKey。这俩相当于密码，赶紧复制保存好，后面要用！

![密钥管理](http://syi4w5o08.hn-bkt.clouddn.com/picgo/20250627234008.png)

### 3. 拿到访问网址

回到存储空间，打开 “文件管理”，找到外链域名，格式一般是[http://xxx.bkt.clouddn.com](http://xxx.bkt.clouddn.com)。这个网址就是以后图片的 “家”，记好啦！

## 二、PicGo 配置七牛云：照着填就完事

先去[picgo 官网](https://picgo.github.io/PicGo-Doc/en/guide/#instruction)下载安装软件。

### 1. 打开设置入口

安装好打开 PicGo，点击菜单栏里的 “图床设置”，找到 “七牛云” 选项。

### 2. 填写关键信息

- **AccessKey 和 SecretKey**：把刚才在七牛云复制的密钥贴进去；

- **存储空间名**：填你在七牛云创建的空间名字；

- **访问网址**：加上http://或https://，粘贴之前拿到的外链域名；

- **存储区域**：华东填z0，华北填z1，华南填z2，北美填na0，东南亚填as0；

- **网址后缀**：按需填写，比如?imgslim，不想填就空着；

- **存储路径**：自定义图片存储路径，像img/，不填用默认路径。

填完点 “确定”，再把七牛云设置成默认图床就大功告成！

![七牛云设置页面](http://syi4w5o08.hn-bkt.clouddn.com/picgo/%E4%B8%83%E7%89%9B%E4%BA%91%E8%AE%BE%E7%BD%AE%E9%A1%B5%E9%9D%A2-20250627233323.png)

## 三、测试避坑指南：遇到问题别慌

上传张图片试试！要是仓库里有图，或者返回的 url 能正常打开，说明配置成功。要是遇到 “download token not specified”，别急！把七牛云存储空间权限改成 “公开” 就行：登录控制台→进入空间→空间设置→访问控制，改成 “公开” 保存，等一会儿图片就能正常显示啦！

![权限修改页面](http://syi4w5o08.hn-bkt.clouddn.com/picgo/20250627234724.png)

## 四、Obsidian 自动传图：懒人福音来啦

### 1. 安装插件

在 Obsidian 插件市场搜索 “picgo”，找到 Image auto upload 插件安装。

### 2. 启用设置

启用插件，选择 PicGo (app)。如果你不想本地留图片，记得打开【上传文件后移除源文件】，不过要根据自己需求来哦！

### 3. 测试成功

随便在 Obsidian 里粘贴张图片，看到这个页面就说明和 PicGo 打通了！还会返回一个 markdown 格式的图片地址，图片能正常显示，以后写笔记再也不用手动传图啦！

```
![image.png](http://xxxx.hn-bkt.clouddn.com/picgo/20250627235248.png)
```

这样一套操作下来，以后不管写文章还是记笔记，图片都能自动上传，效率翻倍！赶紧动手试试，有问题欢迎在评论区交流，手把手帮你解决！