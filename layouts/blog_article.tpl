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
            <div class="wrap content-formatted">
              <div class="inner">

                {% if article.comments_count > 0 %}
                  <div class="comments-title comments-btn comments-open-btn js-comments-open-btn">
                    {{ "comments_for_count" | lc }}
                    <span class="voog-site-blog-comments-count"> ({{ article.comments_count }})</span>
                  </div>

                  <div class="comments-title comments-btn comments-close-btn js-comments-close-btn">
                    {{ "comments_for_count" | lc }}
                    <span class="voog-site-blog-comments-count"> ({{ article.comments_count }})</span>
                  </div>
                {% else %}
                  <div class="comments-title comments-btn comments-open-btn js-comments-open-btn">
                    {{ "comment" | lc }}
                  </div>

                  <div class="comments-title comments-btn comments-close-btn js-comments-close-btn">
                    {{ "comment" | lc }}
                  </div>
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

      <div class="blog-article-nav">
        {% assign article_current = article.title %}

        {% for blog in site.blogs %}
          {% for article in blog.articles %}

            {% if article_current == article.title %}

              {% assign article_next = forloop.index0 | plus: 1 %}
              {% assign article_prev = forloop.index0 | minus: 1 %}

            {% endif %}

          {% endfor %}
        {% endfor %}

        <div class="article-nav-half article-nav-prev">
          {% for blog in site.blogs %}
            {% for article in blog.articles %}

              {% if article_prev == forloop.index0 %}

                <div class="article-nav-direction">Previous story</div>

                <div class="article-nav-title">
                  <a href="{{ article.url }}">{{ article.title }}</a>
                </div>

              {% endif %}

            {% endfor %}
          {% endfor %}
        </div>

        <div class="article-nav-half article-nav-next">
          {% for blog in site.blogs %}
            {% for article in blog.articles %}

              {% if article_next == forloop.index0 %}

                <div class="article-nav-direction">Next story</div>

                <div class="article-nav-title">
                  <a href="{{ article.url }}">{{ article.title }}</a>
                </div>

              {% endif %}

            {% endfor %}
          {% endfor %}
        </div>
      </div>

      {% include 'site-footer' %}
      {% include 'menu-mobile' %}
      {% include 'site-javascripts' %}
      {% include 'voog-tools' with 'blog_article_page' %}
      <script>site.initArticlePage();</script>
    </div>
  </body>
</html>
