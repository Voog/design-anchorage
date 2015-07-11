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
                <section class="blog-article content-area">
                  {% include 'blog-article-template' with 'blog_article_page' %}
                </section>

                {% include 'blog-article-comments' %}

              </div>
            </div>
          </div>

        </div>

      </main>

      {% include 'site-footer' %}
      {% include 'menu-mobile' %}
      {% include 'site-javascripts' %}
      {% include 'voog-tools' with 'blog_article_page' %}
      <script>site.initArticlePage();</script>
    </div>
  </body>
</html>
