<div id="mobile-menu" class="js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">

  <button class="menu-prev-btn js-menu-prev-btn{% if page.level > 1 %} visible{% endif %}">⟵</button>

  {% if site.search.enabled %}
    <button class="search-btn search-open-btn js-mobile-search-toggle-btn{% if page.level <= 1 %} no-back-btn{% endif %}">
      <svg width="18px" height="18px" viewBox="0 0 18 18"  xmlns="http://www.w3.org/2000/svg">
        <path d="M13,11 L12,11 L12,11 C13,10 13,8 13,7 C13,3 10,0 7,0 C3,0 0,3 0,7 C0,10 3,13 7,13 C8,13 10,13 11,12 L11,12 L11,13 L16,18 L18,16 L13,11 ZM7,11 C4,11 2,9 2,7 C2,4 4,2 7,2 C9,2 11,4 11,7 C11,9 9,11 7,11 Z"></path>
      </svg>
    </button>
  {% endif %}

  <div class="navigation-menu">
    <ul{% if page.level <=1 %} class="current-menu"{% endif %}>
      {% unless site.root_item.hidden? %}
        <li>
          <a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="selected visible"{% endif %}{% if page.level <= 1 %} class="visible"{% endif %}>{{site.root_item.title}}</a>
        </li>
      {% endunless %}

      {% for item in site.visible_menuitems %}
        <li>
          <button class="toggle-sub-menu js-toggle-sub-menu{% if item.children? %} js-has-children{% endif %}{% if page.level <= 1 and item.children? %} visible{% endif %}{% if item.current? %} active{% endif %}"></button>
          <a href="{{ item.url }}"{% unless item.translated? %} class="fci-editor-menuadd untranslated"{% endunless %}{% if item.current? %} class="visible selected"{% elsif page.level <= 1 %} class="visible"{% endif %}>{{ item.title }}</a>

          {% if editmode or item.children? %}
            <ul class="sub-menu menu-level-2{% if page.level >= 2 %} current-menu{% endif %}">
              {% for level2 in item.visible_children %}
                <li>
                  <a href="{{ level2.url }}"{% if item.current? %} class="visible indented"{% elsif level2.current? %} class="visible selected"{% elsif (level2.selected? or item.current?) and page.level > 2 %} class="visible"{% else %} class="indented"{% endif %}>{{ level2.title }}</a>

                  {% if editmode or level2.children? %}
                    <ul class="sub-menu menu-level-3{% if level2.selected? %} child-menu{% endif %}">
                      {% for level3 in level2.visible_children %}
                        <li><a href="{{ level3.url }}"{% if level3.current? %} class="visible selected"{% elsif level2.selected? %} class="visible"{% endif %}>{{ level3.title }}</a></li>
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
