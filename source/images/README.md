# 🎨 博客图片资源管理指南

这个文件夹包含了 Hexo Butterfly 主题博客的所有图片资源。

## 📁 文件夹结构

```
source/images/
├── backgrounds/     # 背景图片
├── banners/        # 页面横幅图片
├── branding/       # 品牌相关图片
├── covers/         # 文章封面图片
├── errors/         # 错误页面图片
├── qrcode/         # 二维码图片
└── social/         # 社交媒体图片
```

## 🖼️ 图片规格要求

### 背景图片 (backgrounds/)
- **site-bg.jpg**: 网站整体背景 (1920×1080px, JPG, <500KB)
- **footer-bg.jpg**: 页脚背景 (1920×400px, JPG)

### 横幅图片 (banners/)
- **index-banner.jpg**: 首页横幅 (1920×1080px, JPG)
- **default-banner.jpg**: 默认横幅 (1920×1080px, JPG)
- **archive-banner.jpg**: 归档页面横幅 (1920×1080px, JPG)
- **tag-banner.jpg**: 标签页面横幅 (1920×1080px, JPG)
- **category-banner.jpg**: 分类页面横幅 (1920×1080px, JPG)
- **ai-banner.jpg**: AI 标签专用横幅 (1920×1080px, JPG)
- **tech-banner.jpg**: 技术标签专用横幅 (1920×1080px, JPG)

### 品牌图片 (branding/)
- **logo.png**: 导航栏 Logo (150×50px, PNG, 透明背景)
- **favicon.png**: 网站图标 (32×32px, PNG/ICO)
- **avatar.jpg**: 个人头像 (200×200px, JPG/PNG)

### 文章封面 (covers/)
- **default-1.jpg ~ default-5.jpg**: 默认封面 (800×450px, JPG, <200KB)
- 16:9 比例，高质量但文件大小适中
- 风格统一，色调协调

### 错误页面图片 (errors/)
- **404-bg.jpg**: 404 页面背景 (1920×1080px, JPG)
- **broken-link.png**: 友链损坏图片 (300×200px, PNG)
- **404-post.jpg**: 文章 404 错误图片 (800×450px, JPG)

### 社交媒体图片 (qrcode/ & social/)
- **wechat-qrcode.jpg**: 微信公众号二维码 (300×300px)
- 其他社交平台二维码 (300×300px, JPG/PNG)

## 🎯 设计建议

### 整体风格
- 保持与博客主题一致的色调
- 使用低饱和度、高质量的图片
- 避免过于鲜艳或复杂的图案
- 确保文字在图片上有足够的对比度

### 性能优化
- 背景图片控制在 500KB 以内
- 文章封面控制在 200KB 以内
- 考虑使用 WebP 格式进一步压缩
- 为移动设备准备适当尺寸的版本

### 主题推荐
- **科技/AI 相关**: 适合技术博客
- **自然风景**: 清新淡雅的风格
- **抽象几何**: 现代简约风格
- **学习/知识**: 教育类主题

## 🔗 推荐图片资源

### 免费高质量图片
- **Unsplash**: https://unsplash.com/
- **Pexels**: https://www.pexels.com/
- **Pixabay**: https://pixabay.com/
- **Picsum**: https://picsum.photos/ (占位图片生成器)

### 图标和 Logo
- **Iconfont**: https://www.iconfont.cn/
- **Flaticon**: https://www.flaticon.com/
- **Font Awesome**: https://fontawesome.com/

### 在线工具
- **TinyPNG**: https://tinypng.com/ (图片压缩)
- **Canva**: https://www.canva.com/ (在线设计)
- **Remove.bg**: https://www.remove.bg/ (背景移除)

## 📝 使用说明

### 添加新图片
1. 将图片放入对应的文件夹
2. 确保文件名和尺寸符合规格要求
3. 在主题配置文件中更新图片路径
4. 运行 `hexo clean && hexo generate` 重新生成

### 替换现有图片
1. 保持相同的文件名和格式
2. 确保新图片尺寸符合要求
3. 清理缓存后重新生成站点

### 自定义配置
- 在 `_config.butterfly.yml` 中配置图片路径
- 可以为不同页面设置不同的横幅图片
- 支持随机显示多个封面图片

## ⚠️ 注意事项

1. **版权问题**: 确保使用的图片有合法的使用权限
2. **文件大小**: 控制图片文件大小，避免影响网站加载速度
3. **命名规范**: 使用英文文件名，避免特殊字符
4. **备份重要**: 定期备份自定义的图片资源
5. **移动适配**: 考虑图片在移动设备上的显示效果

## 🚀 快速开始

如果你是第一次配置，可以：

1. 使用当前的占位图片快速预览效果
2. 逐步替换为你自己的品牌图片
3. 根据博客内容调整图片风格
4. 定期更新和优化图片资源

---

*最后更新: 2024-12-01*
*版本: v1.0*
