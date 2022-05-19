<!DOCTYPE html>
{%- assign common_page = true -%}
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="{{ view_mode }} {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" sidebar: true %}
    {% include "template-styles" %}
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

            {%- assign content_title = "content" | lce -%}
            {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}

            <main class="page-content" role="main">
              <div class="main-inner-row content-full">
                <div class="main-content top-row">
                  <div class="wrap">
                    {% if editmode or main_has_content %}
                      <div class="inner{% if editmode or left_has-content or right_has_content %} has-bottom-content{% endif %}">
                        {% include "menu-breadcrumbs" %}

                        {% comment %}TODO: Remove duplicate content-arera class.{% endcomment %}
                        <section class="content-area">
                          <div class="content-body content-area" data-search-indexing-allowed="true">{% content title=content_title title_tooltip=content_title_tooltip %}</div>
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
                          <div class="content-body content-area" data-search-indexing-allowed="true">{% content name="left" title_tooltip=content_title_tooltip %}</div>
                        </section>
                      </div>
                    {% endif %}

                    {% if editmode or right_has_content %}
                      <div class="inner content-half content-right{% unless editmode or main_has_content %} has-padding{% endunless %}">
                        {% comment %}TODO: Remove duplicate content-arera class.{% endcomment %}
                        <section class="content-area">
                          <div class="content-body content-area" data-search-indexing-allowed="true">{% content name="right" title_tooltip=content_title_tooltip %}</div>
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
