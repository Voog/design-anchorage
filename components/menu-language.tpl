{% if editmode or site.has_many_languages? %}
  <nav class="lang-menu js-popup-menu js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
    <button role="button" class="lang-menu-btn js-popup-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}lang-flag-{{ language.code }}{% endif %}{% endfor %}">
      {% if editmode or flags_state == false %}
        <span class="lang-title">
          {% for language in site.languages %}{% if language.selected? %}{{ language.title }}{% endif %}{% endfor %}
          <span class="ico-popover-toggle">▼</span>
        </span>
      {% endif %}
    </button>

    <div class="lang-menu-popover js-popup-menu-popover">
      {% if editmode or site.has_many_languages? %}
        <ul class="menu">
          {% for language in site.languages %}
            <li><a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a></li>
          {% endfor %}

          {% if editmode %}<li class="add-lang-btn">{% languageadd %}</li>{% endif %}
        </ul>

        {% if editmode %}
          <div class="lang-options">
            <ul class="menu">
              <li class="menu-item">
                <button class="option-btn js-option-toggle-flags{% if flags_state %} js-flag-disable-btn{% endif %}">
                  <span class="disable-text">{{ "disable_lang_flags" | lc }}</span>
                  <span class="enable-text">{{ "enable_lang_flags" | lc }}</span>
                </button>
              </li>
            </ul>
          </div>
        {% endif %}
      {% endif %}
    </div>
  </nav>
{% endif %}
