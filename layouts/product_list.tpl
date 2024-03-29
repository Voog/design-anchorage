<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="{{ view_mode }} {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign item_list_page = true %}
    {% include "template-variables" %}
    {% include "html-head" sidebar: true %}
    {% include "template-styles" %}
    {% include "common-page-variables" %}
  </head>

  <body class="{% if sidebar_active %}common-page sidebar-active{% else %}sidebar-inactive{% endif %} item-list-page{% if site.data.has_header_bg_color %} header-top-with-bg{% endif %}">
    {% include "template-svg-spritesheet" %}

    <div class="site-container">
      {% include "site-header" %}

      <div class="page-body js-bg-picker-area">
        <div class="js-background-type {{ body_bg_type }}">
          {% if editmode %}
            <button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="false" data-bg-default-image-color="rgb(255, 255, 255)" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
          {% endif %}

          <div class="background-color js-background-color"></div>

          <div{% if sidebar_active %} class="sidebar-active"{% endif %}>
            {% if sidebar_active %}
              {% include "site-sidebar" %}
            {% endif %}

            <main class="page-content" role="main">
              <div class="main-inner-row content-full">
                <div class="main-content top-row">
                  <div class="wrap">
                    {%- assign content_title = "content" | lce -%}
                    {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}
                    <div class="inner no-bottom-padding content-body content-area" data-search-indexing-allowed="true">{% content title=content_title title_tooltip=content_title_tooltip %}</div>

                    <div class="inner">
                      {% include "menu-breadcrumbs" %}
                      {% include "product-list-block" %}
                    </div>
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
    {% include "template-tools" with "item_list_page" %}
    <script>
      site.initItemsPage();
      site.initWindowResize();
    </script>
  </body>
</html>
