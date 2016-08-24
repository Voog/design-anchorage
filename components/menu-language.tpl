{% if editmode or site.has_many_languages? %}
  {% if editmode or language_menu_mode == "language-menu-mode-popover" %}
    <div class="menu-btn-wrap menu-language-popover-btn js-menu-btn-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
      <button role="button" class="lang-menu-btn js-lang-menu-btn js-popup-menu-btn js-prevent-sideclick lang-flag lang-flag-{{ page.language_code }}" data-lang-code="{{ page.language_code }}">
        <span class="lang-title">
          {% for language in site.languages %}{% if language.selected? %}<span class="lang-title-inner js-lang-title-inner">{{ language.title }}</span>{% endif %}{% endfor %}
        </span>
      </button>
    </div>
  {% endif %}

  {% if editmode or language_menu_mode == "language-menu-mode-list" %}
    <nav class="lang-menu menu-language-list flags-disabled">
      {% for language in site.languages %}
        <div class="lang-title">
          <a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} is-active{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.code }}">{{ language.title }}</a>
        </div>
      {% endfor %}

      {% if editmode %}
        <ul class="menu-language-settings js-menu-language-list-setting-parent">
          {% if language_menu_mode == "language-menu-mode-list" %}
            <li class="menu-item-cms js-menu-language-settings">
              <button class="btn btn-js-styled js-menu-language-settings-toggle js-prevent-sideclick"></button>
            </li>
          {% endif %}
        </ul>
      {% endif %}
    </nav>
  {% endif %}
{% endif %}
