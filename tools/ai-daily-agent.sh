#!/bin/bash
# AI Fun 每日自动日报 - Agent 版
# 通过 openclaw agent CLI 触发 agent 来完成搜索、写作、推送
# 用法：bash ai-daily-agent.sh

set -e

HEXO_DIR="/Users/dyf/aifun"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)
POST_FILE="$HEXO_DIR/source/_posts/$DATE-ai-daily.md"

echo "🤖 开始生成 AI日报: $DATE"

# 使用 openclaw agent CLI 触发 agent 完成搜索、写作、推送
openclaw agent --message "你是 AI Fun 博客的自动编辑。今天需要完成以下任务：

1. **搜索AI资讯**：用 web_search 搜索今天的AI领域重要新闻和动态（搜索2-3次，覆盖不同关键词）
2. **阅读和筛选**：从搜索结果中挑选 3-5 条最有价值的新闻，用 web_fetch 打开原文链接
3. **改写文章**：将每条新闻改写成中文文章，要求：
   - 有自己的标题（不要照搬原文标题）
   - 有摘要（2-3句话概括核心内容）
   - 有正文（3-5段，讲清楚发生了什么、为什么重要）
   - 标注来源链接
   - 语言风格：专业但不死板，适合技术读者
4. **生成Hexo文章**：将改写后的内容写入文件 $POST_FILE，格式：
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

（你的文章内容，每条新闻一个章节）

---

*🤖 由 AI 自动生成于 $DATE $TIME*"
