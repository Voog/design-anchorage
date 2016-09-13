<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}{% unless comment.valid? %} comments-open js-calculate-comments-height{% endunless %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign blog_article_page = true %}
    {% include "template-variables" %}
    {% include "html-head" %}
    {% include "template-styles" %}
    {% if editmode %}
      <style id="preview-style"></style>
    {% endif %}
  </head>

  <body class="blog-article-page{% if site.data.has_header_bg_color %} header-top-with-bg{% endif %}">
    <div class="site-container">
      {% include "site-header" %}

      <div class="page-body js-bg-picker-area">
        <div class="js-background-type {{ blog_body_bg_type }}">
          <div class="background-image js-background-image"></div>
          <div class="background-color js-background-color"></div>

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
                        <span class="comments-title-inner">{{ "comments_for_count" | lc }}</span>
                        <span class="comments-count">({{ article.comments_count }})</span>
                      {% else %}
                        <span class="comments-title-inner">{{ "comment" | lc }}</span>
                      {% endif %}
                    </div>

                    <header class="article-header js-article-body-title-wrap">
                      {% unless photo_article %}
                        <h1 class="article-title js-article-title">{% editable article.title %}</h1>
                      {% endunless %}
                      {% include "blog-article-tags" %}
                    </header>

                    <section class="blog-article content-area">
                      {% include "blog-article-template" with "blog_article_page" %}
                    </section>

                    {% include "blog-article-comments" %}
                  </div>
                </div>
              </div>

            </div>
          </main>
        </div>
      </div>

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
