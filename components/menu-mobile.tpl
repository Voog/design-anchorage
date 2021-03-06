<div id="mobile-menu" class="js-menu-lang-wrap">
  <div class="navigation-menu">
    <ul>
      {% unless site.root_item.hidden? %}
        <li>
          {% menulink site.root_item %}
        </li>
      {% endunless %}

      {% for item in site.visible_menuitems %}
        {% if site.root_item.layout_title == product_list_layout or site.root_item.layout_title == product_layout %}
          {% if editmode %}
            {% include "menu-mobile-level-1-link" render_hidden_categories: true %}
          {% else %}
            {% unless show_product_related_pages_in_main_menu %}
              {% unless item.layout_title == product_list_layout or item.layout_title == product_layout %}
                {% include "menu-mobile-level-1-link" %}
              {% endunless %}
            {% else %}
              {% include "menu-mobile-level-1-link" %}
            {% endunless %}
          {% endif %}
        {% else %}
          {% include "menu-mobile-level-1-link" %}
        {% endif %}
      {% endfor %}
    </ul>

    {% if editmode %}
      <ul class="js-edit-menu {% if page.level <=1 %} child-menu{% endif %}">
        {% if site.hidden_menuitems.size > 0 %}
          <li class="edit-btn">{% menubtn site.hidden_menuitems %}</li>
        {% endif %}
        <li class="edit-btn">{% menuadd %}</li>
      </ul>
    {% endif %}
  </div>

  {% if editmode or site.has_many_languages? %}
    <div class="lang-menu">
      <ul class="js-menu-main-mobile">
        {% for language in site.languages %}
          <li class="lang-item">
            <a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} is-active{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.locale }}">{{ language.title }}</a>
          </li>
        {% endfor %}
        {% if editmode %}
          <li class="edit-btn">{% languageadd %}</li>
        {% endif %}
      </ul>
    </div>
  {% endif %}
</div>
