<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign item_list_page = true %}
    {% include "template-variables" %}
    {% include "html-head" %}
    {% include "template-styles" %}
  </head>

  <body class="item-list-page{% if site.data.has_header_bg_color %} header-top-with-bg{% endif %}">
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
                  <div class="content-item-boxes inner">
                   {% if site.root_item.selected? %}
                     {% if editmode %}
                       <ul class="menu menu-item-list">
                         {% if site.untranslated_menuitems.size > 0 %}
                           <li class="menu-item menu-item-cms">{% menubtn site.untranslated_menuitems %}</li>
                         {% endif %}

                         {% if site.hidden_menuitems.size > 0 %}
                           <li class="menu-item menu-item-cms">{% menubtn site.hidden_menuitems %}</li>
                         {% endif %}

                         <li class="menu-item menu-item-cms">{% menuadd %}</li>

                         {% if site.root_item.selected? %}
                           <li class="menu-item menu-item-cms float-right">
                             <a class="js-root-item-settings-toggle"></a>
                           </li>
                         {% endif %}
                       </ul>
                     {% endif %}

                     {% for level_1 in site.visible_menuitems_with_data %}
                       {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                         {% include "product-list-item" menu_level: level_1 %}
                       {% endif %}
                     {% endfor %}
                   {% else %}
                     {% for level_1 in site.visible_menuitems %}
                       {% if level_1.selected? %}
                         {% if level_1.current? and editmode %}
                           <ul class="menu menu-item-list">
                             {% if level_1.untranslated_children.size > 0 %}
                               <li class="menu-item menu-item-cms">{% menubtn level_1.untranslated_children %}</li>
                             {% endif %}

                             {% if level_1.hidden_children.size > 0 %}
                               <li class="menu-item menu-item-cms">{% menubtn level_1.hidden_children %}</li>
                             {% endif %}

                             <li class="menu-item menu-item-cms">{% menuadd parent="level_1" %}</li>
                           </ul>
                         {% endif %}

                         {% for level_2 in level_1.visible_children_with_data %}
                           {% if level_1.current? %}
                             {% if level_2.layout_title == product_list_layout or level_2.layout_title == product_layout %}
                               {% include "product-list-item" menu_level: level_2 %}
                             {% endif %}
                           {% else %}
                             {% if level_2.selected? %}
                               {% if level_2.current? and editmode %}
                                 <ul class="menu menu-item-list">
                                   {% if level_2.untranslated_children.size > 0 %}
                                     <li class="menu-item menu-item-cms">{% menubtn level_2.untranslated_children %}</li>
                                   {% endif %}

                                   {% if level_2.hidden_children.size > 0 %}
                                     <li class="menu-item menu-item-cms">{% menubtn level_1.hidden_children %}</li>
                                   {% endif %}

                                   <li class="menu-item menu-item-cms">{% menuadd parent="level_2" %}</li>
                                 </ul>
                               {% endif %}

                               {% for level_3 in level_2.visible_children_with_data %}
                                 {% if level_3.layout_title == product_list_layout or level_3.layout_title == product_layout %}
                                   {% include "product-list-item" menu_level: level_3 %}
                                 {% endif %}
                               {% endfor %}
                             {% endif %}
                           {% endif %}
                         {% endfor %}
                       {% endif %}
                     {% endfor %}
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
    {% include "site-javascripts" %}
    {% include "template-tools" with "item_list_page" %}
    <script>
      site.initItemsPage();
      site.initWindowResize();
    </script>
  </body>
</html>
