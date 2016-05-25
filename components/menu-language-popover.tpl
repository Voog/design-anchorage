<nav class="lang-menu lang-menu-popover js-popup-menu-popover js-menu-lang-wrap js-prevent-sideclick {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %} ">
  {% if editmode or site.has_many_languages? %}
    <ul class="menu">
      {% for language in site.languages %}
        <li><a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.code }}">{{ language.title }}</a></li>
      {% endfor %}

      {% if editmode %}<li class="add-lang-btn">{% languageadd %}</li>{% endif %}
    </ul>

    {% if editmode %}
      <div class="lang-options">
        <ul class="menu">
          <li class="menu-item">
            <button class="option-btn js-option-toggle-flags{% if flags_state %} js-flag-disable-btn{% endif %}">
              <span class="disable-text">{{ "disable_lang_flags" | lc: editor_locale }}</span>
              <span class="enable-text">{{ "enable_lang_flags" | lc: editor_locale }}</span>
            </button>
          </li>
        </ul>
      </div>
    {% endif %}
  {% endif %}
</nav>
