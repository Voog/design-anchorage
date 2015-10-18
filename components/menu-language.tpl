{% for language in site.languages %}
  {% assign numb_of_lang = forloop.length %}
{% endfor %}

{% if editmode or site.has_many_languages? %}
  {% if editmode or flags_state == true or numb_of_lang > 2 %}
    <div class="menu-btn-wrap js-menu-btn-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
      <button role="button" class="lang-menu-btn js-lang-menu-btn js-popup-menu-btn js-prevent-sideclick lang-flag {% for language in site.languages %}{% if language.selected? %}lang-flag-{{ language.code }}{% endif %}{% endfor %}">
        <span class="lang-title">
          {% for language in site.languages %}{% if language.selected? %}<span class="lang-title-inner js-lang-title-inner">{{ language.title }}</span>{% endif %}{% endfor %}
          <span class="ico-popover-toggle">▼</span>
        </span>
      </button>
    </div>
  {% else %}
    <nav class="lang-menu lang-menu-bilingual flags-disabled">
      {% for language in site.languages %}
        <div class="lang-title">
          <a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} is-active{% endif %}" href="{{ language.url }}">{{ language.title }}</a>
        </div>
      {% endfor %}
    </nav>
  {% endif %}
{% endif %}
