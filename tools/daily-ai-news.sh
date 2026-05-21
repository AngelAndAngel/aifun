#!/bin/bash
# AI Fun 每日自动日报脚本
# 用法：bash daily-ai-news.sh

set -e

HEXO_DIR="/Users/dyf/aifun"
POSTS_DIR="$HEXO_DIR/source/_posts"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)
POST_FILE="$POSTS_DIR/$DATE-ai-daily.md"

echo "🤖 开始生成 AI日报: $DATE"

# 搜索 AI 最新资讯（macOS 兼容版）
echo "🔍 搜索 AI资讯..."
NEWS_CONTENT=$(curl -s "https://news.google.com/rss/search?q=artificial+intelligence&hl=zh-CN&gl=CN&ceid=CN:zh-Hans" | \
  sed -n 's/.*<title>\(.*\)<\/title>.*/\1/p' | \
  head -15 | \
  awk '{print "- " $0}')

if [ -z "$NEWS_CONTENT" ]; then
  echo "⚠️  未获取到资讯，使用备用源"
  NEWS_CONTENT="- AI日报今日更新（备用内容）"
fi

# 生成 Hexo 文章
echo "📝 生成文章..."
cat > "$POST_FILE" << EOF
---
title: "AI日报 $DATE"
date: $DATE $TIME:00 +0800
tags:
  - AI日报
  - AI资讯
categories:
  - AI日报
---

# AI日报 $DATE

> 每日AI资讯速览，自动更新

## 📰 今日AI资讯

$NEWS_CONTENT

---

*🤖 由 AI 自动生成于 $DATE $TIME*
EOF

echo "✅ 文章已生成: $POST_FILE"

# Hexo 编译
echo "🔨 Hexo 编译中..."
cd "$HEXO_DIR"
npx hexo generate

echo "✅ 编译完成"

# Git 提交和推送
echo "📤 推送到 GitHub..."
git add .
git commit -m "📰 AI日报 $DATE" || echo "⚠️  没有变更"
git push origin main

echo "✅ 完成！文章已发布"
