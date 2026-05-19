# AI Fun - Hexo 静态博客

基于 Hexo 构建的静态博客站点，部署在 Vercel。

## 快速开始

### 本地预览

```bash
npm run dev
```

访问 http://localhost:4000 查看站点。

### 构建静态文件

```bash
npm run build
```

生成的文件位于 `public/` 目录。

### 创建新文章

```bash
npm run new "文章标题"
```

文章会创建在 `source/_posts/` 目录下。

## 写作流程

1. 在 `source/_posts/` 目录下编辑 Markdown 文件
2. 运行 `npm run dev` 本地预览效果
3. 推送到 GitHub，Vercel 自动部署

## 目录结构

- `source/_posts/` - 文章目录（Markdown 文件）
- `source/_drafts/` - 草稿目录
- `scaffolds/` - 文章模板
- `_config.yml` - Hexo 配置文件
- `themes/` - 主题目录

## Vercel 部署

本项目已配置 Vercel 自动部署：

1. 将代码推送到 GitHub
2. 在 Vercel 导入 GitHub 项目
3. Vercel 会自动检测配置并部署

## License

MIT