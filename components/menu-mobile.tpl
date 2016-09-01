<div id="mobile-menu" class="js-menu-lang-wrap">
  <div class="navigation-menu">
    <ul>
      {% unless site.root_item.hidden? %}
        <li>
          {% menulink site.root_item %}
        </li>
      {% endunless %}

      {% for item in site.visible_menuitems %}
        <li{% if item.children? and item.selected? %} class="with-children current-parent"{% elsif item.children? %} class="with-children"{% elsif item.selected? %} class="current-parent"{% endif %}>
          {% menulink item %}

          {% if item.children? %}
            <button class="toggle-sub-menu js-toggle-sub-menu{% if item.selected? %} active highlighted{% endif %}">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 10" width="8px" height="10px">
                <path d="M0,10V0l8,5L0,10z"></path>
              </svg>
            </button>
          {% endif %}

          {% if editmode or item.children? %}
            <ul class="sub-menu menu-level-2">
              {% for level2 in item.visible_children %}
                <li{% if level2.children? and level2.selected? %} class="with-children current-parent"{% elsif level2.children? %} class="with-children"{% elsif level2.selected? %} class="current-parent"{% endif %}>
                  {% menulink level2 %}

                  {% if level2.children? %}
                    <button class="toggle-sub-menu js-toggle-sub-menu{% if level2.selected? %} active highlighted{% endif %}">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 10" width="8px" height="10px">
                        <path d="M0,10V0l8,5L0,10z"></path>
                      </svg>
                    </button>
                  {% endif %}

                  {% if editmode or level2.children? %}
                    <ul class="sub-menu menu-level-3">
                      {% for level3 in level2.visible_children %}
                        <li>{% menulink level3 %}</li>
                      {% endfor %}

                      {% if editmode %}
                        {% if level2.hidden_children.size > 0 %}
                          <li class="edit-btn">{% menubtn level2.hidden_children %}</li>
                        {% endif %}
                        <li class="edit-btn">{% menuadd parent="level2" %}</li>
                      {% endif %}
                    </ul>
                  {% endif %}
                </li>
              {% endfor %}

              {% if editmode %}
                {% if item.hidden_children.size > 0 %}
                  <li class="edit-btn">{% menubtn item.hidden_children %}</li>
                {% endif %}
                <li class="edit-btn">{% menuadd parent="item" %}</li>
              {% endif %}
            </ul>
          {% endif %}
        </li>
      {% endfor %}
    </ul>

    {% if editmode %}
      <ul class="js-edit-menu {% if page.level <=1 %} child-menu{% endif %}">
        {% if site.hidden_menuitems.size > 0 %}
          <li class="edit-btn">{% menubtn site.hidden_menuitems %}</li>
        {% endif %}
        <li class="edit-btn">{% menuadd %}</li>
      </ul>
    {% endif %}
  </div>

  {% if editmode or site.has_many_languages? %}
    <div class="lang-menu">
      <ul class="js-menu-main-mobile">
        {% for language in site.languages %}
          <li class="lang-item">
            <a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} is-active{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.code }}">{{ language.title }}</a>
          </li>
        {% endfor %}
        {% if editmode %}
          <li class="edit-btn">{% languageadd %}</li>
        {% endif %}
      </ul>
    </div>
  {% endif %}
</div>
