<!DOCTYPE html>
{% assign common_page = true %}
{% include "template-variables" %}
<html class="{{ view_mode }} {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" sidebar: true %}
    {% include "template-styles" %}

    {% assign row_settings = page.data.row_settings %}

    {% if row_settings.items_count != nil and row_settings.items_count != "" %}
      {% assign row_count = row_settings.items_count %}
    {% else %}
      {% assign row_count = 1 %}
    {% endif %}

    <style>
      .container-row-flex {
        display: flex;
        flex-wrap: wrap;
        {% if row_settings.padding != nil %}
          margin: 0 -{{row_settings.padding}}px;
        {% endif %}
      }
      .col-item {
        flex: auto;
        {% if row_settings.min_width %}
          min-width: {{row_settings.min_width}}px;
        {% if row_settings.padding %}
        {% endif %}
          padding: {{row_settings.padding}}px;
        {% endif %}
      }

      .container-row-{{row_count}} .col-item {
        {% if row_settings.padding != nil %}
          width: calc(100%/{{row_count}} - {{row_settings.padding}}*2px);
        {% else %}
          width: calc(100%/{{row_count}});
        {% endif %}
      }
    </style>
  </head>

  <body class="common-page{% if site.data.has_header_bg_color %} header-top-with-bg{% endif %}">
    <div class="site-container">
      {% include "site-header" %}
      {% include "common-page-variables" %}

      <div class="page-body js-bg-picker-area">
        <div class="js-background-type {{ body_bg_type }}">
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="false" data-bg-default-image-color="rgb(255, 255, 255)" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="background-color js-background-color"></div>

          <div{% if sidebar_active %} class="sidebar-active"{% endif %}>
            {% if sidebar_active %}
              {% include "site-sidebar" %}
            {% endif %}

            <main class="page-content" role="main">
              <div class="main-inner-row content-full">
                <div class="main-content top-row">
                  <div class="wrap">
                    {% if editmode or main_has_content %}
                      <div class="inner{% if editmode or left_has-content or right_has_content %} has-bottom-content{% endif %}">
                        {% include "menu-breadcrumbs" %}

                        {% comment %}TODO: Remove duplicate content-arera class.{% endcomment %}
                        <section class="content-area">
                          {% if editmode %}
                            <button disabled class="js-settings-btn">Rows editor</button>
                          {% endif %}

                          {% assign count = 1 %}

                          {% if row_count %}
                            {% assign count = row_count | to_num %}
                          {% endif %}

                          <div class="content-body container-row-flex container-row-{{ row_count }}">
                          {% for i in (1..count) %}
                            {% if forloop.first != true %}
                              {% assign name = "col-" | append: i %}
                            {% endif %}
                            <div class="col-item" data-search-indexing-allowed="true">
                              {% content name=name %}
                            </div>
                          {% endfor %}
                          </div>
                        </section>
                      </div>
                    {% endif %}
                  </div>
                </div>

                <div class="main-content bottom-row">
                  <div class="wrap">
                    {% if editmode or left_has_content %}
                      <div class="inner content-half content-left{% unless editmode or main_has_content %} has-padding{% endunless %}">
                        {% comment %}TODO: Remove duplicate content-arera class.{% endcomment %}
                        <section class="content-area">
                          <div class="content-body content-area" data-search-indexing-allowed="true">{% content name="left" %}</div>
                        </section>
                      </div>
                    {% endif %}

                    {% if editmode or right_has_content %}
                      <div class="inner content-half content-right{% unless editmode or main_has_content %} has-padding{% endunless %}">
                        {% comment %}TODO: Remove duplicate content-arera class.{% endcomment %}
                        <section class="content-area">
                          <div class="content-body content-area" data-search-indexing-allowed="true">{% content name="right" %}</div>
                        </section>
                      </div>
                    {% endif %}
                  </div>
                </div>
              </div>
            </main>
          </div>
        </div>
      </div>
      {% include "site-footer" %}
    </div>

    {% include "menu-mobile" %}
    {% include "site-signout" %}
    {% include "site-javascripts" %}
    {% include "template-tools" with "common_page" %}
    <script>
      site.initCommonPage();
      site.initWindowResize();
    </script>
  </body>
</html>
