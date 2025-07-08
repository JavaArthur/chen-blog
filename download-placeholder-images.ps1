# PowerShell 脚本：下载占位图片
# 运行此脚本来下载所有占位图片

Write-Host "开始下载占位图片..." -ForegroundColor Green

# 创建下载函数
function Download-Image {
    param(
        [string]$Url,
        [string]$OutputPath
    )
    
    try {
        Write-Host "下载: $OutputPath" -ForegroundColor Yellow
        Invoke-WebRequest -Uri $Url -OutFile $OutputPath -UseBasicParsing
        Write-Host "✅ 完成: $OutputPath" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ 失败: $OutputPath - $($_.Exception.Message)" -ForegroundColor Red
    }
}

# 品牌图片
Write-Host "`n📁 下载品牌图片..." -ForegroundColor Cyan
Download-Image "https://via.placeholder.com/150x50/42b883/ffffff?text=晨启AI" "source/images/branding/logo.png"
Download-Image "https://via.placeholder.com/32x32/42b883/ffffff?text=C" "source/images/branding/favicon.png"
Download-Image "https://via.placeholder.com/200x200/42b883/ffffff?text=Avatar" "source/images/branding/avatar.jpg"

# 横幅图片
Write-Host "`n📁 下载横幅图片..." -ForegroundColor Cyan
Download-Image "https://picsum.photos/1920/1080?random=1" "source/images/banners/index-banner.jpg"
Download-Image "https://picsum.photos/1920/1080?random=2" "source/images/banners/default-banner.jpg"
Download-Image "https://picsum.photos/1920/1080?random=3" "source/images/banners/archive-banner.jpg"
Download-Image "https://picsum.photos/1920/1080?random=4" "source/images/banners/tag-banner.jpg"
Download-Image "https://picsum.photos/1920/1080?random=5" "source/images/banners/category-banner.jpg"
Download-Image "https://picsum.photos/1920/1080?random=6" "source/images/banners/ai-banner.jpg"
Download-Image "https://picsum.photos/1920/1080?random=7" "source/images/banners/tech-banner.jpg"

# 文章封面
Write-Host "`n📁 下载文章封面..." -ForegroundColor Cyan
Download-Image "https://picsum.photos/800/450?random=11" "source/images/covers/default-1.jpg"
Download-Image "https://picsum.photos/800/450?random=12" "source/images/covers/default-2.jpg"
Download-Image "https://picsum.photos/800/450?random=13" "source/images/covers/default-3.jpg"
Download-Image "https://picsum.photos/800/450?random=14" "source/images/covers/default-4.jpg"
Download-Image "https://picsum.photos/800/450?random=15" "source/images/covers/default-5.jpg"

# 背景图片
Write-Host "`n📁 下载背景图片..." -ForegroundColor Cyan
Download-Image "https://picsum.photos/1920/1080?random=21&blur=2" "source/images/backgrounds/site-bg.jpg"
Download-Image "https://picsum.photos/1920/400?random=22" "source/images/backgrounds/footer-bg.jpg"

# 错误页面图片
Write-Host "`n📁 下载错误页面图片..." -ForegroundColor Cyan
Download-Image "https://via.placeholder.com/1920x1080/42b883/ffffff?text=404+Page+Not+Found" "source/images/errors/404-bg.jpg"
Download-Image "https://via.placeholder.com/300x200/ff6b6b/ffffff?text=Link+Broken" "source/images/errors/broken-link.png"
Download-Image "https://via.placeholder.com/800x450/ffa726/ffffff?text=Post+Not+Found" "source/images/errors/404-post.jpg"

Write-Host "`n所有占位图片下载完成！" -ForegroundColor Green
Write-Host "提示：这些只是占位图片，建议后续替换为更符合你品牌风格的图片。" -ForegroundColor Yellow
