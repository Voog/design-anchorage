{% if site.has_language_tags? %}
  <section class="blog-tags">
    <div class="tags-toggle">
      <div class="tags-icon">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 14" width="14px" height="14px">
          <path d="M12.7,0H8.2c-0.5,0-1,0.2-1.3,0.5L0.4,7.1c-0.5,0.5-0.5,1.3,0,1.8l4.7,4.7C5.4,13.9,5.7,14,6,14c0.3,0,0.7-0.1,0.9-0.4 l6.5-6.5C13.8,6.8,14,6.3,14,5.8V1.3C14,0.6,13.4,0,12.7,0z M13.1,5.8c0,0.2-0.1,0.5-0.3,0.7L6.3,13c-0.1,0.1-0.2,0.1-0.3,0.1 c-0.1,0-0.2,0-0.3-0.1L1,8.3C0.8,8.1,0.8,7.8,1,7.7l6.5-6.5C7.7,1,8,0.9,8.2,0.9h4.5c0.2,0,0.4,0.2,0.4,0.4V5.8z M11.8,2.8 c0,0.4-0.3,0.7-0.7,0.7c-0.4,0-0.7-0.3-0.7-0.7s0.3-0.7,0.7-0.7C11.5,2.2,11.8,2.5,11.8,2.8z"/>
        </svg>
      </div>
      <div class="tags-title">{{ 'filter_posts' | lc }}</div>

      <div class="ico-arrow"></div>
    </div>

    <nav class="menu-tags">
      <div class="tags-bottom{% if tags and tags != empty %} visible{% endif %}">
        <ul class="menu">
          <li class="menu-item">
            <a class="menu-link js-tags-all{% unless tags and tags != empty %} active{% endunless %}" href="/{{ page.path }}">{{ 'all_posts' | lc }}</a>
          </li>
          {% for tag in site.language_tags %}
            {% assign activestr = " " %}
            {% for tmptag in tags %}
              {% if tmptag.name == tag.name %}
                {% assign activestr = " active" %}
              {% endif %}
            {% endfor %}
            
            <li class="menu-item">
              <a class="menu-link{{ activestr }}" href="/{{ page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
            </li>
          {% endfor %}
        </ul>
      </div>
    </nav>
  </section>
{% endif %}
