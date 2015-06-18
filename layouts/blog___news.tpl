<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">

    {% include 'voog-tools-variables' %}
    {% include 'html-head' %}
    {% include 'voog-tools-styles' %}
    {% if editmode %}
      <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
      <style id="preview-style"></style>
    {% endif %}

  </head>

  <body class="blog-news-page">
    <div class="site-container">
      {% include 'site-header' %}
      {% comment %}{% include 'site-sidebar' %}{% endcomment %}

      <main class="page-content" role="main">
        <div class="main-inner-row content-full">

          <div class="main-content">
            <div class="wrap content-formatted">
              <div class="inner">
                <section class="blog-articles content-area">
                  {% addbutton %}
                  {% for article in articles %}
                    {% include 'blog-article-template' %}
                  {% endfor %}
                </section>
              </div>
            </div>
          </div>

        </div>
      </main>

      {% include 'site-footer' %}
      {% include "menu-mobile" %}
      {% include 'site-javascripts' %}
      {% include 'voog-tools' %}
      <script>site.initBlogPage();</script>
    </div>
  </body>
</html>
