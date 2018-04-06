<!DOCTYPE html>
{% include "template-variables" %}
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
                      <div class="inner no-bottom-padding content-body content-area" data-search-indexing-allowed="true">{% content %}</div>

                    <div class="inner">
                      {% include "menu-breadcrumbs" %}

                      <div class="content-item-boxes">
                        {% if site.root_item.selected? %}
                          {% for level_1 in site.visible_menuitems_with_data %}
                            {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                              {% include "product-list-item" menu_level: level_1 %}
                            {% endif %}
                          {% endfor %}
                        {% else %}
                          {% for i in (1..4) %}
                            {% assign level_str = 'menuitems_on_level_' | append: i %}
                            {% for item in site[level_str] %}
                              {% if item.selected? %}
                                {% for item_child in item.visible_children_with_data %}
                                  {% if item.current? %}
                                    {% if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout %}
                                      {% include "product-list-item" menu_level: item_child %}
                                    {% endif %}
                                  {% endif %}
                                {% endfor %}
                              {% endif %}
                            {% endfor %}
                          {% endfor %}
                        {% endif %}
                      </div>
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
    {% include "site-javascripts" %}
    {% include "template-tools" with "item_list_page" %}
    <script>
      site.initItemsPage();
      site.initWindowResize();
    </script>
  </body>
</html>
