---
title: "如何使用 GitHub Pages 和 Hexo 搭建个人博客"
description: "介绍在 macOS 下使用 GitHub Pages、Hexo 和 NexT 主题搭建个人博客的完整过程。"
pubDate: "2018-04-15T14:43:58+08:00"
slug: "2018/04/15/how-to-build-a-blog-with-GitHub-Pages-and-Hexo"
tags: ["技术", "GitHub Pages", "Hexo"]
archived: true
draft: false
cover: "/images/github-pages.png"
---
_摘要_

本文介绍在 macOS 系统下如何使用 GitHub Pages 和 Hexo 搭建个人博客。

笔者电脑是 MacBook Pro，以下操作都是在 macOS 下进行。

## GitHub Pages

[GitHub Pages](<https://pages.github.com/>) 是 GitHub 提供的一个静态网站托管服务，网站内容可以直接存放在 GitHub 的 repository（仓库）中，由于使用方便，可定制性强，该服务在程序员中广受欢迎。目前 GitHub Pages 对应的仓库容量上限是1GB，网站的访问流量上限是100GB/月，每小时支持10次以内的网站部署。

在 GitHub 创建一个名为 yourname.github.io 的仓库，其中 yourname 是你 GitHub 账户的 ID。如下图所示：

![GitHub Pages 仓库设置示例](/images/github-pages.png)

其中 yourname.github.io 即是 GitHub Pages 提供的网站域名。

## Hexo

[Hexo](<https://hexo.io/zh-cn/>) 是一个静态博客框架，作者是台湾的一位技术人员（[作者 Twitter](<https://twitter.com/tommy351>)），所以中文文档齐全且更新及时。Hexo 支持 Markdown，可快速部署至 GitHub Pages，拥有很多简洁漂亮的博客主题。相较于 GitHub Pages 官网推荐的博客框架 Jekyll，使用 Hexo 无需了解太多的网页开发知识，即可快速搭建美观的个人博客。

安装 Hexo 前需要确保电脑上已安装以下程序：

  * Git
  * Node.js

Homebrew（[官网](<https://brew.sh/index_zh-cn.html>)）是一个很方便的软件包管理器，可以使用命令行安装所需的软件。在 terminal 中输入以下命令安装 Homebrew。

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### 安装 Git

macOS 有两种方式安装 git。

第一种是通过 Xcode。在 terminal 中输入以下命令，如果 macOS 尚未安装 git，terminal 会弹窗提示你安装 Command Line Tools，根据提示操作即可。

```bash
git --version
```

第二种是通过 Homebrew。在 terminal 中输入以下命令即可。

```bash
brew install git
```

建议查看 git 版本以确认安装成功。

### 安装 Node.js

Hexo 运行依赖 Node.js 环境，可直接使用 Homebrew 安装。

```bash
brew install node
```

检查 Node.js 的版本号。

```text
node -v
```

### 安装 Hexo

在配置好相关的软件环境，就可以安装 Hexo，考虑到 Hexo 也在不断迭代更新，网上一些教程的操作方法已经过时了，建议大家根据[官方的文档](<https://hexo.io/zh-cn/docs/index.html>)操作，以下操作以写文章时官网的文档为准。

使用 npm 安装 Hexo。

```bash
npm install -g hexo-cli
```

执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件，其中 `<folder>` 是指你的博客文件夹。

```bash
hexo init <folder>
cd <folder>
npm install
```

之后启动 Hexo。

```bash
hexo s
```

在浏览器中输入网址 `http://localhost:4000/`，即可在本地查看网站。

### 关联 GitHub

目前可以在本地查看网站，接下来就是关联你的 GitHub 账号，将网站托管在 GitHub Pages。

在 `<folder>` 目录下打开 `_config.yml` 文件，修改以下内容，`yourname` 就是你的 GitHub 账户 ID。

```text
deploy:
  type: git
  repository: https://github.com/yourname/yourname.github.io.git
  branch: master
```

还需要安装 [hexo-deployer-git](<https://github.com/hexojs/hexo-deployer-git>)。

```bash
npm install hexo-deployer-git --save
```

### 部署 Hexo

在 `<folder>` 目录生成静态网页文件。

```bash
hexo g
```

部署网页。

```bash
hexo d
```

此时，就可以在网址 `http://yourname.github.io` 中查看你的网站了。

以下是 Hexo 常用的命令。

```text
hexo clean  // 清除缓存文件 (db.json) 和已生成的静态文件 (public)
hexo g  	// hexo generate 命令的简写，生成静态文件
hexo s		// hexo server 命令的简写，启动服务器。默认情况下，本地访问网址为：http://localhost:4000/
hexo d		// hexo deploy 命令的简写，部署网站。
```

## 写作博客

可以执行下列命令来创建一篇新文章。

```text
hexo new [layout] <title>
```

其中 [layout] 默认有三种布局：post、page 和 draft，在缺省情况下为 post 布局。

如果觉得麻烦，也可以直接在博客目录 `<folder>/source/_posts` 文件夹里面新建文件，删除博客的操作类似。

## NexT 主题

[NexT](<http://theme-next.iissnan.com/>) 是一个基于 Hexo 的简洁美观的主题框架，作者是国人，安装配置简便，集成了丰富的第三方服务，文档齐全，使用者甚众，本博客亦是采用 NexT 主题。

本文不再详述 NexT 的安装步骤，可直接参考[官方文档](<http://theme-next.iissnan.com/getting-started.html>)。

**参考**

  1. [mac下搭建github博客](<https://zhuanlan.zhihu.com/p/26401542>)
  2. [Mac搭建Hexo博客及NexT主题配置优化](<https://madongqiang2201.github.io/2016/07/21/Mac%E4%B8%8BHexo%EF%BC%8Bgithub-pages%E6%90%AD%E5%BB%BA%E9%9D%99%E6%80%81%E5%8D%9A%E5%AE%A2/>)
  3. [使用 Hexo 为自己在 Github 上建一个静态 Blog 站点](<http://lixiaolai.com/2016/06/22/makecs-build-a-blog-with-hexo-on-github/>)
