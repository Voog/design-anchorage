<ul class="menu menu-item-list{% if sidebar_active and site.root_item.selected? == false %} is-hidden-desktop{% endif %}">
  {% if page.level > 0 %}
    {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
      <span class="menu-separator">/</span>
      {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-item" %}
    {% endif %}
  {% endif %}

  {% for i in (1..5) %}
    {% assign level_str = 'menuitems_on_level_' | append: i %}
    {% for level in site[level_str] %}
      {% if site.root_item.layout_title == product_list_layout %}
        {% assign page_Lvl = 0 %}
      {% else %}
        {% assign page_Lvl = 1 %}
      {% endif %}
      {% if level.selected? and page.level > page_Lvl %}
        <span class="menu-separator">/</span>
        {% menulink level wrapper-tag="li" wrapper-class="menu-item" %}
      {% endif %}
    {% endfor %}
  {% endfor %}

  {% if site.root_item.selected? %}
    {% if editmode %}
        <li class="menu-item menu-item-cms">{% menuadd %}</li>

        {% if site.root_item.selected? and site.root_item.layout_title == product_list_layout %}
          <li class="menu-item menu-item-cms float-right">
            <a class="js-root-item-settings-toggle"></a>
          </li>
        {% endif %}
    {% endif %}
  {% else %}

    {% for i in (1..5) %}
      {% assign level_str = 'menuitems_on_level_' | append: i %}
      {% for item in site[level_str] %}
        {% if item.selected? %}
          {% if item.current? and editmode %}

            {% if item.untranslated_children.size > 0 %}
              <li class="menu-item menu-item-cms">{% menubtn item.untranslated_children %}</li>
            {% endif %}

            {% if item.hidden_children.size > 0 %}
              <li class="menu-item menu-item-cms">{% menubtn item.hidden_children %}</li>
            {% endif %}

            {% unless item.layout_title == product_layout %}
            <li class="menu-item menu-item-cms">{% menuadd parent="level" %}</li>
            {% endunless %}

          {% endif %}
        {% endif %}
      {% endfor %}
    {% endfor %}
  {% endif %}
</ul>
