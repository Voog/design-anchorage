<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign blog_article_page = true %}
    {% include "template-variables" %}
    {% include "html-head" %}
    {% include "template-styles" %}
  </head>

  <body class="blog-article-page">
    <div class="site-container">
      {% include "site-header" %}

      <main class="page-content" role="main">

        <div class="main-inner-row content-full">

          <div class="main-content">
            <div class="wrap">
              <div class="inner content-area">

                <div class="article-meta js-text-article-component{% if photo_article %} is-hidden{% endif %}">
                  <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}, </time>
                  <div class="article-author">{{ article.author.name }}</div>
                </div>

                <div class="comments-title comments-btn comments-toggle-btn js-comments-toggle-btn js-prevent-sideclick">
                  {% if article.comments_count > 0 %}
                    {{ "comments_for_count" | lc }}
                    <span class="voog-site-blog-comments-count">({{ article.comments_count }})</span>
                  {% else %}
                    {{ "comment" | lc }}
                  {% endif %}
                </div>

                <header class="article-header js-article-body-title-wrap">{% unless photo_article %}<h1 class="article-title js-article-title">{% editable article.title %}</h1>{% endunless %}</header>

                <section class="blog-article content-area">
                  {% include "blog-article-template" with "blog_article_page" %}
                </section>

                {% include "blog-article-comments" %}
              </div>
            </div>
          </div>

        </div>

      </main>

      {% include "site-footer" with "blog_article_page" %}
    </div>


    {% include "menu-mobile" %}
    {% include "site-javascripts" %}
    {% include "template-tools" with "blog_article_page" %}
    <script>
      site.initArticlePage();
      site.initWindowResize();
    </script>
  </body>
</html>
