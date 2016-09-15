{% for language in site.languages %}
  {% assign numb_of_lang = forloop.length %}
{% endfor %}

{% if editmode or site.has_many_languages? %}
  {% if editmode or flags_state == true or numb_of_lang > 2 %}
    <div class="menu-btn-wrap js-menu-btn-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
      <button role="button" class="lang-menu-btn js-lang-menu-btn js-popup-menu-btn js-prevent-sideclick lang-flag lang-flag-{{ page.language_code }}" data-lang-code="{{ page.language_code }}" {{  edy_intro_add_lang }}>
        <span class="lang-title">
          {% for language in site.languages %}{% if language.selected? %}<span class="lang-title-inner js-lang-title-inner">{{ language.title }}</span>{% endif %}{% endfor %}
        </span>
      </button>
    </div>
  {% else %}
    <nav class="lang-menu lang-menu-bilingual flags-disabled">
      {% for language in site.languages %}
        <div class="lang-title">
          <a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} is-active{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.code }}">{{ language.title }}</a>
        </div>
      {% endfor %}
    </nav>
  {% endif %}
{% endif %}
