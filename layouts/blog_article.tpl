<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign blog_article_page = true %}
    {% include 'voog-tools-variables' with 'blog_article_page' %}
    {% include 'html-head' %}
    {% include 'voog-tools-styles' %}
    {% if editmode %}
      <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
      <style id="preview-style"></style>
    {% endif %}
  </head>

  <body class="blog-article-page">
    <div class="site-container">
      {% include 'site-header' %}

      <main class="page-content" role="main">

        <div class="main-inner-row content-full">

          <div class="main-content">
            <div class="wrap">
              <div class="inner content-formatted">

                {% if editmode %}
                {% elsif article.data.content_top_bg.imageSizes == nil or article.data.content_top_bg.imageSizes == "" %}
                  <div class="article-meta">
                    <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | date: "%d. %B %Y" }}, </time>
                    <div class="article-author">{{ article.author.name }}</div>
                  </div>
                {% else %}
                {% endif %}

                <div class="comments-title comments-btn comments-open-btn js-comments-open-btn">
                  {% if article.comments_count > 0 %}
                    {{ "comments_for_count" | lc }}
                    <span class="voog-site-blog-comments-count"> ({{ article.comments_count }})</span>
                  {% else %}
                    {{ "comment" | lc }}
                  {% endif %}
                </div>

                <div class="comments-title comments-btn comments-close-btn js-comments-close-btn">
                  {% if article.comments_count > 0 %}
                    {{ "comments_for_count" | lc }}
                    <span class="voog-site-blog-comments-count"> ({{ article.comments_count }})</span>
                  {% else %}
                    {{ "comment" | lc }}
                  {% endif %}
                </div>

                {% if editmode %}
                {% elsif article.data.content_top_bg.imageSizes == nil or article.data.content_top_bg.imageSizes == "" %}
                  <header class="article-header">
                    <h1 class="article-title">{% if editmode %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
                  </header>
                {% else %}
                {% endif %}

                <section class="blog-article content-area">
                  {% include 'blog-article-template' with 'blog_article_page' %}
                </section>

                {% include 'blog-article-comments' %}

              </div>
            </div>
          </div>

        </div>

      </main>

      {% include 'site-footer' with 'blog_article_page' %}
    </div>


    {% include 'menu-mobile' %}
    {% include 'site-javascripts' %}
    {% include 'voog-tools' with 'blog_article_page' %}
    <script>
      site.initArticlePage();
      site.initWindowResize();
    </script>
  </body>
</html>
