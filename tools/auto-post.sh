#!/bin/bash
# AI Fun 自动日报脚本
# 用法: bash auto-post.sh "文章标题" "文章内容文件路径"

set -e

HEXO_DIR="/Users/dyf/aifun"
POSTS_DIR="$HEXO_DIR/source/_posts"
DATE=$(date +%Y-%m-%d)
TITLE="${1:-AI日报 $DATE}"
CONTENT_FILE="${2:-/tmp/ai-daily-$DATE.md}"

# 如果内容文件不存在，退出
if [ ! -f "$CONTENT_FILE" ]; then
  echo "错误: 内容文件不存在 $CONTENT_FILE"
  exit 1
fi

# 生成文件名（用日期）
POST_FILE="$POSTS_DIR/$DATE-ai-daily.md"

# 添加 Hexo front-matter
cat > "$POST_FILE" << EOF
---
title: $TITLE
date: $DATE
tags:
  - AI日报
  - AI资讯
categories:
  - AI日报
---

$(cat "$CONTENT_FILE")
EOF

echo "✅ 文章已生成: $POST_FILE"

# Hexo 编译
cd "$HEXO_DIR"
npx hexo generate

echo "✅ Hexo 编译完成"

# Git 提交和推送
git add .
git commit -m "📰 AI日报 $DATE"
git push origin main

echo "✅ 已推送到 GitHub"
