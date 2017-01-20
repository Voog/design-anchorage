<nav class="menu-main visibility-lrg js-menu-main-desktop">
  <ul class="menu">
    {% unless site.root_item.hidden? %}
      {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
        {% if page.layout_title == product_list_layout or page.layout_title == product_layout %}
          {% menulink site.root_item wrapper-tag="li" wrapper-class="selected" %}
        {% else %}
          {% menulink site.root_item wrapper-tag="li" %}
        {% endif %}
      {% else %}
        {% menulink site.root_item wrapper-tag="li" %}
      {% endif %}
    {% endunless %}

    {% for item in site.visible_menuitems %}
      {% if site.root_item.layout_title == product_list_layout or site.root_item.layout_title == product_layout %}
        {% if editmode %}
          {% include "menu-level-1-link" render_hidden_categories: true %}
        {% else %}
          {% unless show_product_related_pages_in_main_menu %}
            {% unless item.layout_title == product_list_layout or item.layout_title == product_layout %}
              {% include "menu-level-1-link" %}
            {% endunless %}
          {% else %}
            {% include "menu-level-1-link" %}
          {% endunless %}
        {% endif %}
      {% else %}
        {% include "menu-level-1-link" %}
      {% endif %}
    {% endfor %}
  </ul>
  {% if editmode %}
    <ul class="menu">
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li {{ edy_intro_add_page }}>{% menuadd %}</li>
    </ul>
  {% endif %}
</nav>
