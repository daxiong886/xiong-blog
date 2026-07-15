+++
date = '2026-07-12T13:46:38+08:00'
draft = false
title = '我的第一个博客是如何搭建的'
summary = '从选择 Hugo 到部署 GitHub Pages，记录我建立个人博客的完整过程。'
weight = 4
tags = ['Hugo', 'GitHub Pages', '博客搭建', '技术记录']
categories = ['技术']
+++
很长一段时间，我都觉得自己应该有一个属于自己的地方，用来记录一些东西。

社交媒体适合分享即时的情绪和碎片化的信息，但这些内容往往很快会被新的内容覆盖。相比之下，一个独立的博客更像是属于自己的数字空间，可以长期保存自己的学习、经历和思考。

所以，我决定尝试搭建一个属于自己的博客。

最开始，我并不知道搭建博客需要什么技术。在了解了一些方案之后，我选择了 Hugo。

Hugo 是一个静态网站生成器，它不需要复杂的后台系统，只需要编写 Markdown 文件，就可以生成一个完整的网站。

这种方式很符合我的需求：写作本身应该尽可能简单，而技术应该服务于内容。

于是，我开始尝试使用 Hugo、PaperMod 主题以及 GitHub Pages，把这个博客一点点搭建起来。

## 开始搭建

确定使用 Hugo 之后，真正开始搭建博客。

整个过程并没有想象中复杂。Hugo 负责生成网站内容，PaperMod 提供网站的主题样式，而 GitHub Pages 则负责将网站发布到互联网上。

整体来说，一个博客网站主要包含几个部分：

- 一个负责生成网页的工具
- 一个负责设计页面样式的主题
- 一个保存项目文件的平台
- 一个让别人可以访问网站的平台

### 准备工具

在我的博客中：

- Hugo 就像网站的“建造工具”，负责把文章转换成网页；
- PaperMod 是网站的“装修风格”，负责页面的样式；
- GitHub 用来保存我的博客文件；
- GitHub Pages 负责把网站发布到互联网上。

简单理解，就是：

我负责写文章，Hugo 负责生成网页，GitHub 负责保存和发布。

## 创建 Hugo 项目

在正式创建博客之前，需要先在本地电脑安装 Hugo。

这里的“本地”指的是自己的电脑，而不是 GitHub 网页。

为了搭建这个博客，我主要使用了几个工具。

- PowerShell：用来执行 Hugo 命令，例如创建项目、启动网站；
- VS Code：用来编辑文章和修改配置文件；
- GitHub：用来保存项目文件，并通过 GitHub Pages 发布网站。

安装完成后，打开 PowerShell，进入博客项目所在的文件夹。

然后执行：

hugo new site xiong-blog

这条命令会创建一个新的 Hugo 网站项目。

其中 xiong-blog 是博客项目的名称，你可以替换成自己的名字。

执行完成后，会生成一个包含配置文件、文章目录等内容的博客框架。

## 添加博客主题

创建 Hugo 项目之后，我们得到的是一个基础的网站框架。

但是此时的网站还没有具体的页面样式，
就像一间刚建好的房子，只有结构，没有装修。

Hugo 本身只负责生成网站内容，页面的外观需要通过主题（Theme）来实现。

Hugo 提供了大量免费的主题，用户可以根据自己的需求选择：

https://themes.gohugo.io/

不同主题的设计风格不同，有的适合个人博客，有的适合文档网站，也有的适合展示作品。

我选择的是 PaperMod。

它的特点是：

- 页面简洁；
- 加载速度快；
- 适合个人博客；
- 配置相对简单。

PaperMod 项目地址：

https://github.com/adityatelange/hugo-PaperMod

不同主题的安装方式可能略有区别，下面以我选择的 PaperMod 为例，介绍完整安装过程。

## 安装 PaperMod

找到喜欢的主题之后，需要按照主题作者提供的方法进行安装。

Hugo 的主题通常存放在项目目录中的 `themes` 文件夹里。

例如：

```text
xiong-blog
├── content
├── themes
├── hugo.toml
└── ...
```

其中：

- `content` 用来存放文章；
- `themes` 用来存放网站主题；
- `hugo.toml` 用来配置网站信息。

安装 PaperMod 时，需要先打开 PowerShell（Windows）或者终端（macOS/Linux）。

这里的终端类似于电脑的命令控制台，可以通过输入命令来操作文件和运行 Hugo。

打开 PowerShell 后，需要进入 Hugo 项目所在的位置。

例如我的项目名称是 xiong-blog：

```bash
cd xiong-blog
```

`cd` 是切换目录（change directory）的意思。

执行后，终端的位置就会进入 Hugo 项目文件夹。

然后继续安装 PaperMod：

```bash
git clone https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```

这条命令会把 PaperMod 下载到 Hugo 项目的 `themes` 文件夹中。

执行完成后，项目目录中会出现：

```text
themes
└── PaperMod
```

说明主题已经安装完成。

## 配置 Hugo 使用主题

安装完成 PaperMod 后，Hugo 已经拥有了主题文件，但是还不知道网站需要使用哪一个主题。

因此，需要修改 Hugo 的配置文件，让 Hugo 加载 PaperMod。

Hugo 项目的配置文件通常位于项目根目录：

```text
hugo.toml
```

这个文件用于管理网站的基础设置，例如网站名称、主题、语言等。

打开 `hugo.toml`，找到：

```toml
theme = ""
```

将它修改为：

```toml
theme = "PaperMod"
```

保存后，Hugo 就会使用 PaperMod 作为网站主题。

简单理解：

- `themes` 文件夹：存放下载的主题文件；
- `hugo.toml`：告诉 Hugo 当前网站使用哪个主题。

完成主题配置后，就可以启动本地服务器，提前查看博客效果。

## 本地预览博客

完成主题配置后，可以先在自己的电脑上预览博客效果。

在正式发布到互联网之前，本地预览可以帮助我们检查网站样式、文章内容以及配置是否正确。

首先，打开 PowerShell，并进入 Hugo 项目所在的文件夹。

例如：

```bash
cd xiong-blog
```

进入项目目录后，执行：

```bash
hugo server
```

这条命令会启动 Hugo 的本地服务器。

如果启动成功，终端会显示类似：

```text
Web Server is available at http://localhost:1313/
```

此时打开浏览器，访问：

```text
http://localhost:1313/
```

就可以看到自己的博客页面。

需要注意的是：

此时的网站只运行在自己的电脑上，只有自己可以访问。

简单理解：

- `hugo server`：启动一个临时的网站服务器；
- `localhost:1313`：表示本机上的博客地址；
- 修改文章或配置后，Hugo 会自动刷新页面，方便实时查看效果。

确认博客页面没有问题后，下一步就可以创建第一篇文章，并准备将网站发布到互联网上。

## 创建第一篇文章

网站框架搭建完成后，接下来需要添加自己的内容。

在 Hugo 中，文章通常保存在：

```text
content/posts
```

这个文件夹中。

Hugo 使用 Markdown 文件来编写文章，文件后缀通常为：

```text
.md
```

例如：

```text
content
└── posts
    └── first-post.md
```

创建文章最简单的方法是使用 Hugo 提供的命令：

```bash
hugo new post/first-post.md
```

执行后，Hugo 会在文章目录中生成一个新的 Markdown 文件。

打开这个文件，可以看到类似内容：

```toml
+++
title = "first-post"
date = "2026-07-12"
draft = true
+++
```

这些内容叫做 Front Matter，用于设置文章的基本信息。

例如：

- `title`：文章标题；
- `date`：发布时间；
- `draft`：是否为草稿。

如果：

```toml
draft = true
```

表示文章还没有完成，不会显示在正式网站中。

修改为：

```toml
draft = false
```

文章才会正常发布。

下面就可以在 Front Matter 后面使用 Markdown 编写正文。

例如：

```markdown
我的第一篇博客

这是我的第一篇 Hugo 博客文章。

以后我会在这里记录学习、生活以及一些思考。
```

保存后，重新运行：

```bash
hugo server
```

刷新浏览器，就可以看到刚刚创建的文章。

## 上传博客到 GitHub

本地博客搭建完成后，需要将项目上传到 GitHub。

GitHub 可以理解为一个在线代码仓库，用来保存网站文件。

同时，后面的 GitHub Pages 也会从这个仓库中读取网站内容，并自动发布成网页。

首先，需要在 GitHub 创建一个新的仓库（Repository）。

例如：

```text
xiong-blog
```

创建完成后，将本地 Hugo 项目与 GitHub 仓库连接。

打开 PowerShell，进入 Hugo 项目目录：

```bash
cd xiong-blog
```

初始化 Git：

```bash
git init
```

Git 会开始管理这个项目中的文件。

然后，将所有文件添加到 Git：

```bash
git add .
```

提交第一次修改：

```bash
git commit -m "first commit"
```

接下来，将本地项目连接到 GitHub 仓库。

例如：

```bash
git remote add origin https://github.com/你的用户名/xiong-blog.git
```

最后，将文件上传到 GitHub：

```bash
git push -u origin main
```

上传完成后，刷新 GitHub 仓库页面，就可以看到 Hugo 项目的所有文件。

简单理解：

- 本地电脑：负责编写和修改博客；
- Git：记录项目变化；
- GitHub：保存博客文件；
- GitHub Pages：负责把博客发布到互联网。

完成这一步后，博客文件已经保存到了 GitHub，下一步就可以使用 GitHub Pages 部署网站。

## 使用 GitHub Pages 发布博客

将博客文件上传到 GitHub 后，下一步就是让其他人可以通过浏览器访问这个网站。

GitHub Pages 是 GitHub 提供的免费静态网站托管服务，可以直接将仓库中的网站发布到互联网上。

简单来说：

- Hugo：负责生成网页；
- GitHub：保存博客文件；
- GitHub Pages：让别人可以访问博客。

---

### 配置 GitHub Pages

首先进入 GitHub 仓库页面。

打开：

```text
Settings
```

然后找到：

```text
Pages
```

在部署方式中选择：

```text
GitHub Actions
```

这样 GitHub 会通过自动化流程部署 Hugo 网站。

---

### 创建 GitHub Actions 自动部署

为了让每次更新博客后，网站能够自动更新，需要创建一个 GitHub Actions 配置文件。

在项目目录中新建：

```text
.github/workflows/hugo.yml
```

目录结构如下：

```text
xiong-blog
├── content
├── themes
├── hugo.toml
└── .github
    └── workflows
        └── hugo.yml
```

打开 `hugo.yml`，写入：

```yaml
name: Deploy Hugo site

on:
  push:
    branches:
      - main

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: true

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: latest

      - name: Build Hugo site
        run: hugo --minify

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

      - name: Deploy to GitHub Pages
        uses: actions/deploy-pages@v4
```

这个文件的作用是：

当你向 GitHub 提交新的文章时，GitHub Actions 会自动：

1. 下载你的博客项目；
2. 安装 Hugo；
3. 生成网站文件；
4. 发布到 GitHub Pages。

---

### 修改网站地址

在 Hugo 配置文件：

```text
hugo.toml
```

中设置：

```toml
baseURL = "https://你的用户名.github.io/仓库名/"
```

例如：

```toml
baseURL = "https://daxiong886.github.io/xiong-blog/"
```

保存后提交代码：

```bash
git add .
git commit -m "deploy blog"
git push
```

等待 GitHub Actions 运行完成。

部署成功后，在：

```text
Settings → Pages
```

中可以看到网站地址。

打开链接，就可以访问自己的博客。

---

完成这些步骤后，一个完整的个人博客就搭建完成了。

以后更新博客，只需要：

```bash
修改文章
↓
git add .
↓
git commit
↓
git push
```

GitHub Actions 会自动完成部署。

完成部署后，博客已经可以正常访问

但是对于第一次搭建博客的人来说，真正的难点往往不只是完成部署，还有许多工具和操作需要慢慢熟悉。

下面记录我第一次搭建博客时遇到的问题。

## 第一次搭建博客时遇到的问题与思考

虽然 Hugo 本身并不复杂，但对于第一次搭建个人博客的人来说，真正困难的地方并不是记住几条命令，而是不知道每一步应该在哪里完成。

刚开始接触时，我需要同时面对多个工具之间的配合。

例如：

- 文件应该在哪里创建？
- 命令应该在 PowerShell 中输入，还是在 VS Code 中修改？
- 修改完成后，如何同步到 GitHub？
- 网站部署失败后，应该从哪里查看问题？

这些问题看起来简单，但对于第一次接触博客搭建的人来说，比单纯学习几个命令更加困难。

在搭建过程中，我逐渐发现，一个博客网站并不是由某一个工具独立完成的，而是多个环节共同协作：

- 本地电脑：负责编写和修改文章；
- Hugo：负责将 Markdown 文件转换成网页；
- Git：负责记录项目变化；
- GitHub：负责保存项目文件；
- GitHub Actions：负责自动构建网站；
- GitHub Pages：负责将网站展示给访问者。

在不断解决这些问题的过程中，我也慢慢理解了搭建博客真正的意义。

它并不只是把文字发布到互联网上，而是第一次让我完整经历了一个想法从产生，到实现，再到被别人看见的过程。

从电脑里的几行文字，到最后能够被世界另一端的人打开，中间经历了文件、代码、服务器和无数次调试。

有时候，创造一件东西的意义，并不在于它是否足够完美，而是在于它曾经真实地存在过。

这个博客或许还有很多不足，但它记录了我第一次真正参与创造一件属于自己的东西。

未来这里会留下我的思考、学习、技术尝试，以及那些正在发生的人生经历。

而这一切，都从这个并不完美的第一版博客开始。