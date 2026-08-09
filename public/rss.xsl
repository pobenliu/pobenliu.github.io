<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" />

  <xsl:template match="/">
    <html lang="zh-Hans">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title><xsl:value-of select="/rss/channel/title" /> · RSS</title>
        <style>
          * { box-sizing: border-box; }
          body {
            margin: 0;
            background: #fbfaf7;
            color: #2d2a28;
            font-family: "Microsoft YaHei", "Microsoft YaHei UI", "PingFang SC", "Noto Sans CJK SC", Arial, sans-serif;
            font-size: 16px;
            line-height: 1.75;
          }
          body::before { display: block; height: 3px; background: #2d2a28; content: ""; }
          a { color: inherit; text-underline-offset: 0.18em; }
          a:hover { color: #824734; }
          header, main { width: min(calc(100% - 2rem), 720px); margin-inline: auto; }
          header { padding: 2.75rem 0 2rem; text-align: center; }
          .brand {
            display: inline-block;
            padding: 0.4rem 1.5rem;
            background: #2d2a28;
            color: #fffdf9;
            font-size: 20px;
            text-decoration: none;
          }
          .brand:hover { color: #fffdf9; }
          h1 { margin: 1.5rem 0 0.55rem; font-size: 28px; font-weight: 500; }
          header p { margin: 0 auto; color: #5d5752; }
          .help {
            margin-top: 1.25rem;
            padding-top: 1.1rem;
            border-top: 1px solid #e5ded5;
            color: #8c847c;
            font-size: 14px;
          }
          .help a { color: #824734; }
          main { padding-bottom: 4rem; }
          main h2 { margin: 0; padding-bottom: 0.75rem; font-size: 22px; font-weight: 500; }
          article { padding: 1.5rem 0; border-top: 1px solid #e5ded5; }
          article time { color: #8c847c; font-size: 14px; }
          article h3 { margin: 0.35rem 0 0.55rem; font-size: 22px; font-weight: 500; line-height: 1.4; }
          article h3 a { text-decoration: none; }
          article p { margin: 0; color: #5d5752; }
        </style>
      </head>
      <body>
        <header>
          <a class="brand" href="{/rss/channel/link}"><xsl:value-of select="/rss/channel/title" /></a>
          <h1>订阅博客</h1>
          <p><xsl:value-of select="/rss/channel/description" /></p>
          <p class="help">这是 RSS 订阅源。请复制当前页面地址并添加到 RSS 阅读器，或查看<a href="/subscribe/">订阅说明</a>。</p>
        </header>

        <main>
          <h2>最新文章</h2>
          <xsl:for-each select="/rss/channel/item">
            <article>
              <time><xsl:value-of select="pubDate" /></time>
              <h3><a href="{link}"><xsl:value-of select="title" /></a></h3>
              <p><xsl:value-of select="description" /></p>
            </article>
          </xsl:for-each>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
