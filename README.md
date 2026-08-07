# Reveries

pobenliu 的个人博客，基于 Astro 7、Markdown Content Collections 和 Pagefind 构建，部署到 GitHub Pages。

## 本次升级

- 将 2018 年旧站的两篇文章和配图迁移为 Markdown，并保留原始文章 URL。
- 重做响应式首页、归档、标签、文章、关于、搜索和 404 页面。
- 增加深浅色主题、文章目录、阅读进度、代码复制与上一篇/下一篇导航。
- 增加 canonical、Open Graph、JSON-LD、RSS、sitemap、robots.txt 和本地全文搜索。
- 使用 GitHub Actions 自动构建并发布，不再把生成后的 HTML 当作源代码维护。

## 本地开发

需要 Node.js 24 和 pnpm。

```bash
pnpm install
pnpm dev
```

## 内容管理

文章位于 `src/content/blog/`。每篇文章使用以下 frontmatter：

```yaml
---
title: "文章标题"
description: "文章摘要"
pubDate: "2026-08-07T12:00:00+08:00"
slug: "2026/08/07/article-slug"
tags: ["标签"]
draft: false
---
```

`slug` 会直接成为文章 URL。已有的两篇文章保留了 2018 年的原始地址。

## 检查与构建

```bash
pnpm check
pnpm build
pnpm preview
```

`pnpm build` 会先生成静态站点，再创建 Pagefind 搜索索引。

## 发布到 GitHub Pages

项目已包含 `.github/workflows/deploy.yml`。将本项目提交到 `pobenliu/pobenliu.github.io` 后：

1. 打开仓库的 **Settings → Pages**。
2. 将 **Build and deployment → Source** 改为 **GitHub Actions**。
3. 推送到 `main` 或 `master` 分支。

GitHub Actions 会自动构建并发布站点。

建议在替换旧站前先保留一个备份分支：

```bash
git switch -c archive/hexo-2018
git push origin archive/hexo-2018
git switch master
```

然后用本项目内容替换仓库根目录、提交并推送。若默认分支已经改为 `main`，请把上面的 `master` 替换为 `main`。

发布完成后检查：

- 首页、两篇旧文章 URL 与 `/404.html` 可以访问；
- `/rss.xml`、`/sitemap-index.xml` 与 `/search/` 正常；
- 仓库 **Actions** 中的部署任务为绿色。
