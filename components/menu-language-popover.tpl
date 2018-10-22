<nav class="lang-menu lang-menu-popover js-popup-menu-popover js-menu-lang-wrap js-prevent-sideclick">
  {% if editmode or site.has_many_languages? %}
    <ul class="menu js-menu-language-popover-setting-parent">
      {% for language in site.languages %}
        <li class="lang-title"><a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.locale }}">{{ language.title }}</a></li>
      {% endfor %}

      {% if editmode %}
        <li class="menu-item-cms">{% languageadd %}</li>

        {% if language_menu_mode == "language-menu-mode-popover" %}
          <li class="menu-item-cms js-menu-language-settings">
            <button class="btn btn-js-styled js-menu-language-settings-toggle js-prevent-sideclick"></button>
          </li>
        {% endif %}
      {% endif %}
    </ul>
  {% endif %}
</nav>
