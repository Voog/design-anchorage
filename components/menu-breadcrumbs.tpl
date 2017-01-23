<ul class="menu menu-item-list{% if sidebar_active and site.root_item.selected? == false %} is-hidden-desktop{% endif %}">
  {% for level_1 in site.menuitems %}
    {% if level_1.selected? %}
      {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
        {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-item" %}
        <span class="menu-separator">/</span>
        {% menulink level_1 wrapper-tag="li" wrapper-class="menu-item" %}
      {% endif %}

      {% if level_1.children? %}
        {% for level_2 in level_1.children %}
          {% if level_2.selected? %}
            {% unless site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
              {% menulink level_1 wrapper-tag="li" wrapper-class="menu-item" %}
            {% endunless %}

            <span class="menu-separator">/</span>
            {% menulink level_2 wrapper-tag="li" wrapper-class="menu-item" %}

            {% if level_2.children? %}
              {% for level_3 in level_2.children %}
                 {%if level_3.selected? %}
                    <span class="menu-separator">/</span>
                    {% menulink level_3 wrapper-tag="li" wrapper-class="menu-item" %}
                 {% endif %}
              {% endfor %}
            {% endif %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endfor %}

  {% if site.root_item.selected? %}
    {% if editmode %}
        <li class="menu-item menu-item-cms">{% menuadd %}</li>

        {% if site.root_item.selected? %}
          <li class="menu-item menu-item-cms float-right">
            <a class="js-root-item-settings-toggle"></a>
          </li>
        {% endif %}
    {% endif %}
  {% else %}
    {% for level_1 in site.visible_menuitems %}
      {% if level_1.selected? %}
        {% if level_1.current? and editmode %}

          {% if level_1.hidden_children.size > 0 %}
            <li class="menu-item menu-item-cms">{% menubtn level_1.hidden_children %}</li>
          {% endif %}

          <li class="menu-item menu-item-cms">{% menuadd parent="level_1" %}</li>
        {% endif %}

        {% for level_2 in level_1.visible_children_with_data %}
          {% if level_2.selected? %}
            {% if level_2.current? and editmode %}
              {% if level_2.untranslated_children.size > 0 %}
                <li class="menu-item menu-item-cms">{% menubtn level_2.untranslated_children %}</li>
              {% endif %}

              {% if level_2.hidden_children.size > 0 %}
                <li class="menu-item menu-item-cms">{% menubtn level_1.hidden_children %}</li>
              {% endif %}

              <li class="menu-item menu-item-cms">{% menuadd parent="level_2" %}</li>
            {% endif %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endfor %}
  {% endif %}
</ul>
