<!DOCTYPE html>
{% assign blog_page = true %}
{% include "template-variables" %}
{% include "blog-article-variables" %}
<html class="{{ view_mode }} {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
    {% include "template-styles" %}
  </head>

  <body class="blog-news-page{% if site.data.has_header_bg_color %} header-top-with-bg{% endif %}">
    <div class="site-container">
      {% include "site-header" %}

      <div class="page-body js-bg-picker-area">
        <div class="js-background-type {{ blog_body_bg_type }}">
          <div class="background-image js-background-image"></div>
          <div class="background-color js-background-color"></div>

          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="blog_body_bg" data-bg-picture-boolean="false" data-bg-default-image-color="rgb(255, 255, 255)" data-bg-color="{{ blog_body_bg_color }}" data-bg-color-data="{{ blog_body_bg_color_data_str | escape }}"></button>{% endif %}

          <main class="page-content" role="main">

            <div class="main-inner-row content-full">

              <div class="main-content">
                <div class="wrap">
                  <div class="inner">
                    <div class="blog-intro-content content-area" data-search-indexing-allowed="true">{% content %}</div>

                    {% include "blog-news-tags" %}

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
                              {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

                              {% if article_year == current_year %}
                                {% assign article_date_format = "long_without_year" %}
                              {% else %}
                                {% assign article_date_format = "long" %}
                              {% endif %}

                              <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
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
      </div>

      {% include "site-footer" %}
    </div>


    {% include "menu-mobile" %}
    {% include "site-signout" %}
    {% include "site-javascripts" %}
    {% include "template-tools" with "blog_page" %}
    <script>
      site.initBlogPage();
      site.initWindowResize();
    </script>
  </body>
</html>
