<div id="mobile-menu" class="js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">

  <button class="menu-prev-btn js-menu-prev-btn{% if page.level > 1 %} visible{% endif %}">⟵</button>

  {% if site.search.enabled %}
    <button class="search-btn search-open-btn js-mobile-search-toggle-btn{% if page.level <= 1 %} no-back-btn{% endif %}">
      <svg width="20px" height="20px" viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg">
        <path d="M15.323,13.712 C15.323,14.194 15.135,14.647 14.794,14.988 C14.453,15.328 14,15.516 13.519,15.516 C13.037,15.516 12.584,15.328 12.243,14.988 C12.243,14.988 9.136,11.881 9.136,11.881 C8.279,12.318 7.323,12.588 6.294,12.588 C2.818,12.588 0,9.77 0,6.294 C0,2.818 2.818,0 6.294,0 C9.77,0 12.588,2.818 12.588,6.294 C12.588,7.424 12.266,8.47 11.745,9.387 C11.745,9.387 14.794,12.437 14.794,12.437 C15.135,12.777 15.323,13.23 15.323,13.712 ZM6.295,1.516 C3.655,1.516 1.514,3.656 1.514,6.297 C1.514,8.937 3.655,11.078 6.295,11.078 C8.936,11.078 11.076,8.937 11.076,6.297 C11.076,3.656 8.936,1.516 6.295,1.516 Z "></path>
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
                  <li><a href="{{ level2.url }}"{% if item.current? %} class="visible indented"{% elsif level2.current? %} class="visible selected"{% elsif (level2.selected? or item.current?) and page.level > 2 %} class="visible"{% else %} class="indented"{% endif %}>{{ level2.title }}</a></li>

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
