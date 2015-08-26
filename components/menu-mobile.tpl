<div id="mobile-menu" class="js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
  <div class="mobile-site-options">
    <a href="#" class="mobile-menu-close"></a>

    {% if site.search.enabled %}
      <button class="search-btn search-open-btn js-mobile-search-toggle-btn">
        <svg width="20px" height="20px" viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg">
          <path d="M15.323,13.712 C15.323,14.194 15.135,14.647 14.794,14.988 C14.453,15.328 14,15.516 13.519,15.516 C13.037,15.516 12.584,15.328 12.243,14.988 C12.243,14.988 9.136,11.881 9.136,11.881 C8.279,12.318 7.323,12.588 6.294,12.588 C2.818,12.588 0,9.77 0,6.294 C0,2.818 2.818,0 6.294,0 C9.77,0 12.588,2.818 12.588,6.294 C12.588,7.424 12.266,8.47 11.745,9.387 C11.745,9.387 14.794,12.437 14.794,12.437 C15.135,12.777 15.323,13.23 15.323,13.712 ZM6.295,1.516 C3.655,1.516 1.514,3.656 1.514,6.297 C1.514,8.937 3.655,11.078 6.295,11.078 C8.936,11.078 11.076,8.937 11.076,6.297 C11.076,3.656 8.936,1.516 6.295,1.516 Z "></path>
        </svg>
      </button>
    {% endif %}

    {% if editmode or site.has_many_languages? %}
      <a href="#" role="button" class="language-menu-btn">
        <span class="lang-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}lang-flag-{{ language.code }}{% endif %}{% endfor %}">
          {% if editmode or flags_state == false %}
            <span class="lang-title">
              {% for language in site.languages %}{% if language.selected? %}{{ language.title }}{% endif %}{% endfor %}
            </span>
          {% endif %}
        </span>
      </a>
    {% endif %}
  </div>

  {% if editmode or site.has_many_languages? %}
    <div class="lang-menu">
      <ul>
        {% for language in site.languages %}
          <li>
            <a class="{% if language.selected? %} selected{% endif %}" href="{{ language.url }}">{{ language.title }}</a>
          </li>
        {% endfor %}
        {% if editmode %}<li>{% languageadd %}</li>{% endif %}

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
  {% endif %}

  <div class="navigation-menu">
    <ul>
      {% unless site.root_item.hidden? %}
        <li><a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="selected"{% endif %}>{{site.root_item.title}}</a></li>
      {% endunless %}
      {% for item in site.visible_menuitems %}
        <li>
          <a href="{{ item.url }}" {% if item.selected? %} class="selected"{% endif %}{% unless item.translated? %} class="fci-editor-menuadd untranslated"{% endunless %}>
            {{ item.title }}
          </a>

          {% if editmode or item.children? %}
            <div class="submenu-load-more submenu-load-more-lvl1{% if item.selected? %} open{% endif %}"></div>
            <div class="submenu-load-more submenu-close-lvl1{% if item.selected? %} open{% endif %}"></div>
            <ul class="submenu{% if item.selected? %} open{% endif %}">

              {% for level2 in item.visible_children %}
                <li{% unless level2.translated? %} class="untranslated"{% endunless %}>
                  <a href="{{ level2.url }}"{% if level2.selected? %} class="selected"{% endif %}>{{ level2.title }}</a>

                  {% if level2.selected? %}
                    {% if editmode or level2.children? %}
                      <div class="submenu-load-more submenu-load-more-lvl2{% if level2.selected? %} open{% endif %}"></div>
                      <div class="submenu-load-more submenu-close-lvl2{% if level2.selected? %} open{% endif %}"></div>
                      <ul class="submenu-lvl2{% if level2.selected? %} open{% endif %}">

                        {% for level3 in level2.visible_children %}
                          <li{% unless level3.translated? %} class="untranslated"{% endunless %}>
                            <a href="{{ level3.url }}"{% if level3.selected? %} class="selected"{% endif%}>{{ level3.title }}</a>
                          </li>
                        {% endfor %}

                      </ul>
                    {% endif %}
                  {% endif %}

                </li>
              {% endfor %}
            </ul>
          {% endif %}

        </li>
      {% endfor %}

      {% if editmode %}
        {% if site.hidden_menuitems.size > 0 %}
          <li>{% menubtn site.hidden_menuitems %}</li>
        {% endif %}
        <li>{% menuadd %}</li>
      {% endif %}
    </ul>
  </div>

  {% if site.search.enabled %}
    <div id="mobile-search">
      {% include "site-search" %}
    </div>
  {% endif %}
</div>
