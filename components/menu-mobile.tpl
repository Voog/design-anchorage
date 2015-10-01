<div id="mobile-menu" class="js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">

{% comment %}  {% if site.search.enabled %}
    <button class="search-btn search-open-btn js-mobile-search-toggle-btn{% if page.level <= 1 %} no-back-btn{% endif %}">
      <svg width="18px" height="18px" viewBox="0 0 18 18"  xmlns="http://www.w3.org/2000/svg">
        <path d="M13,11 L12,11 L12,11 C13,10 13,8 13,7 C13,3 10,0 7,0 C3,0 0,3 0,7 C0,10 3,13 7,13 C8,13 10,13 11,12 L11,12 L11,13 L16,18 L18,16 L13,11 ZM7,11 C4,11 2,9 2,7 C2,4 4,2 7,2 C9,2 11,4 11,7 C11,9 9,11 7,11 Z"></path>
      </svg>
    </button>
  {% endif %}{% endcomment %}

  <div class="navigation-menu">
    <ul>
      {% unless site.root_item.hidden? %}
        <li>
          {% menulink site.root_item %}
        </li>
      {% endunless %}

      {% for item in site.visible_menuitems %}
        <li{% if item.selected? %} class="current-parent"{% endif %}>
          {% if item.children? %}<button class="toggle-sub-menu js-toggle-sub-menu{% if item.selected? %} active{% endif %}"></button>{% endif %}
          {% menulink item %}

          {% if editmode or item.children? %}
            <ul class="sub-menu menu-level-2">
              {% for level2 in item.visible_children %}
                <li{% if level2.selected? %} class="current-parent"{% endif %}>
                  {% if level2.children? %}<button class="toggle-sub-menu js-toggle-sub-menu{% if level2.selected? %} active{% endif %}"></button>{% endif %}
                  {% menulink level2 %}

                  {% if editmode or level2.children? %}
                    <ul class="sub-menu menu-level-3">
                      {% for level3 in level2.visible_children %}
                        <li>{% menulink level3 %}</li>
                      {% endfor %}

                      {% if editmode %}
                        {% if site.hidden_menuitems.size > 0 %}
                          <li>{% menubtn level2.hidden_menuitems %}</li>
                        {% endif %}
                        <li>{% menuadd parent="level2" %}</li>
                      {% endif %}
                    </ul>
                  {% endif %}
                </li>
              {% endfor %}

              {% if editmode %}
                {% if site.hidden_menuitems.size > 0 %}
                  <li>{% menubtn item.hidden_menuitems %}</li>
                {% endif %}
                <li>{% menuadd parent="item" %}</li>
              {% endif %}
            </ul>
          {% endif %}
        </li>
      {% endfor %}
    </ul>

    {% if editmode %}
      <ul class="js-edit-menu {% if page.level <=1 %} child-menu{% endif %}">
        {% if site.hidden_menuitems.size > 0 %}
          <li>{% menubtn site.hidden_menuitems %}</li>
        {% endif %}
        <li>{% menuadd %}</li>
      </ul>
    {% endif %}
  </div>

  <div class="lang-menu">
    <ul>
      {% for language in site.languages %}
        <li>
          <a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} is-active{% endif %}" href="{{ language.url }}">{{ language.title }}</a>
        </li>
      {% endfor %}
      {% if editmode %}<li class="edit-btn">{% languageadd %}</li>{% endif %}

      {% if editmode %}
        <div class="mobile-lang-options">
          <button class="option-btn js-option-toggle-flags{% if flags_state %} js-flag-disable-btn{% endif %}">
            <span class="disable-text">{{ "disable_lang_flags" | lc }}</span>
            <span class="enable-text">{{ "enable_lang_flags" | lc }}</span>
          </button>
        </div>
      {% endif %}
    </ul>
  </div>

  {% if site.search.enabled %}
    <div id="mobile-search">
      {% include "site-search" %}
    </div>
  {% endif %}
</div>
