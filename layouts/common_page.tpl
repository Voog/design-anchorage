<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign common_page = true %}
    {% include "template-variables" %}
    {% include "html-head" %}
    {% include "template-styles" %}
  </head>

  <body class="common-page">
    <div class="site-container">
      {% include "site-header" %}

      {% for item in site.menuitems_with_hidden %}
        {% if item.selected? %}
          {% if editmode or item.children? %}
            {% assign sidebar_active = true %}
          {% endif %}
        {% endif %}
      {% endfor %}

      <div class="page-body js-bg-picker-area">
        {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="false" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
        <div class="background-color js-background-color"></div>

        <div{% if sidebar_active %} class="sidebar-active{% endif %}">
          {% if sidebar_active %}
            {% include "site-sidebar" %}
          {% endif %}

          <main class="page-content" role="main">
            {% comment %}Set variables to detect if "content areas" have content{% endcomment %}
            {% capture content_main_html %}{% unless editmode %}{% content %}{% endunless %}{% endcapture %}
            {% capture content_main_size %}{{ content_main_html | size | minus : 1 }}{% endcapture %}
            {% capture content_left_html %}{% unless editmode %}{% content name="left" %}{% endunless %}{% endcapture %}
            {% capture content_left_size %}{{ content_left_html | size | minus : 1 }}{% endcapture %}
            {% capture content_right_html %}{% unless editmode %}{% content name="right" %}{% endunless %}{% endcapture %}
            {% capture content_right_size %}{{ content_right_html | size | minus : 1 }}{% endcapture %}

            <div class="main-inner-row content-full light-background">
              <div class="main-content top-row">
                <div class="wrap">
                  <div class="inner">
                    <section class="content-area">
                      <div class="content-body content-area" data-search-indexing-allowed="true">{% content %}</div>
                    </section>
                  </div>
                </div>
              </div>

              <div class="main-content bottom-row">
                <div class="wrap">
                  <div class="inner content-half content-left">
                    <section class="content-area">
                      <div class="content-body content-area" data-search-indexing-allowed="true">{% content name="left" %}</div>
                    </section>
                  </div>

                  <div class="inner content-half content-right">
                    <section class="content-area">
                      <div class="content-body content-area" data-search-indexing-allowed="true">{% content name="right" %}</div>
                    </section>
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
    {% include "site-javascripts" %}
    {% include "template-tools" with "common_page" %}
    <script>
      site.initCommonPage();
      site.initWindowResize();
    </script>
  </body>
</html>
