<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign front_page = true %}



    {% include 'voog-tools-variables' %}
    {% include 'html-head' %}
    {% include 'voog-tools-styles' %}
    {% if editmode %}
  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
  <style id="preview-style"></style>
{% endif %}

  </head>

  <body class="front-page">
    <div class="site-container">

      {% include 'site-header' %}

      <main class="page-content" role="main">

        <div class="main-inner-row content-full content-left js-content-left">
          <div class="background-image stretch"></div>
          <div class="background-color stretch"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_left_bg_image }}" data-bg-image-sizes="{{ content_left_bg_image_sizes_str | escape }}" data-bg-color="{{ content_left_bg_color }}" data-bg-color-data="{{ content_left_bg_color_data_str | escape }}"></button>{% endif %}

          <div class="main-content">
            <div class="wrap content-formatted js-background-type {{ content_left_bg_type }}">
              <div class="inner">
                {% content %}
              </div>
            </div>
          </div>

          <div class="main-feature">
            <div class="wrap content-formatted js-background-type {{ content_left_bg_type }}">
              <div class="feature-left inner inner-left content-formatted{% if editmode %} narrow-feature{% else %}{% unless feature_right_size contains '-' %} narrow-feature{% endunless %}{% endif %}">{% content name="feature_left" %}</div>
              <div class="feature-center inner inner-center content-formatted{% if editmode %} narrow-feature{% else %}{% unless feature_left_size contains '-' %} narrow-feature{% endunless %}{% endif %}">{% content name="feature_center" %}</div>
              <div class="feature-right inner inner-right content-formatted{% if editmode %} narrow-feature{% else %}{% unless feature_left_size contains '-' %} narrow-feature{% endunless %}{% endif %}">{% content name="feature_right" %}</div>
            </div>
          </div>

        </div>

        <div class="blog-feed content-full content-right js-content-right">
          <div class="background-image stretch"></div>
          <div class="background-color stretch"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_right_bg_image }}" data-bg-image-sizes="{{ content_right_bg_image_sizes_str | escape }}" data-bg-color="{{ content_right_bg_color }}" data-bg-color-data="{{ content_right_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="wrap js-background-type {{ content_right_bg_type }}">
            {% if site.latest_articles.size > 0 %}
              <section class="blog inner">
                <h1 class="blog-title">{{ "latest_news" | lc }}</h1>
                {% for article in site.latest_articles limit: 1 %}
                  <article class="post">
                    <h2 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h2>
                    <button class="custom-btn"><a href="{{ article.url }}">Read on</a></button>
                  </article>
                {% endfor %}
              </section>
            {% endif %}
          </div>
        </div>

      </main>


      {% include 'site-footer' %}

      {% include "menu-mobile" %}

      {% include 'site-javascripts' %}
      {% include 'voog-tools' %}
      <script>site.initFrontPage();</script>
    </div>
  </body>
</html>
