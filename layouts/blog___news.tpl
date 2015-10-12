<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign blog_page = true %}
    {% include "template-variables" %}
    {% include "html-head" %}
    {% include "template-styles" %}
  </head>

  <body class="blog-news-page">
    <div class="site-container">
      {% include "site-header" %}

      <div class="page-body">
        <main class="page-content" role="main">

          <div class="main-inner-row content-full">

            <div class="main-content">
              <div class="wrap">
                <div class="inner">
                  <section class="blog-articles content-area">
                    {% addbutton %}
                    {% for article in articles limit: 5 %}
                      {% include "blog-article-template" %}
                    {% endfor %}
                  </section>

                  {% assign articles_size = articles | size %}
                  {% if articles_size >= 6 %}
                    <section class="articles-listing content-area">
                      <header class="articles-listing-header">
                        <h2 class="articles-listing-title">{{ "older_news" | lc }}</h2>
                      </header>
                      {% for article in articles offset: 5 %}
                        <article class="blog-article">
                          <header class="article-header">
                            <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time>
                            <h1 class="article-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
                          </header>
                        </article>
                      {% endfor %}
                    </section>
                  {% endif %}
                </div>
              </div>
            </div>

          </div>
        </main>
      </div>

      {% include "site-footer" %}
    </div>


    {% include "menu-mobile" %}
    {% include "site-javascripts" %}
    {% include "template-tools" with "blog_page" %}
    <script>
      site.initBlogPage();
      site.initWindowResize();
    </script>
  </body>
</html>
