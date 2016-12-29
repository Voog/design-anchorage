<nav class="menu-main visibility-lrg">
  <ul class="menu">
    {% unless site.root_item.hidden? %}
      {% menulink site.root_item wrapper-tag="li" %}
    {% endunless %}

    {% for item in site.visible_menuitems %}
      {% if site.root_item.layout_title == product_list_layout %}
        {% if editmode %}
          {% include "menu-level-1-link" render_hidden_categories: true %}
        {% else %}
          {% if hide_categories_from_main_menu %}
            {% unless item.layout_title == product_list_layout or item.layout_title == product_layout %}
              {% include "menu-level-1-link" %}
            {% endunless %}
          {% else %}
            {% unless item.layout_title == product_layout %}
              {% include "menu-level-1-link" %}
            {% endunless %}
          {% endif %}
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
