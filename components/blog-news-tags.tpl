<section class="blog-tags">
  {% if site.has_language_tags? %}
    <button class="tags-toggle">
      <div class="tags-icon">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 8" width="15px" height="15px">
          <path d="M7.3,0H4.7C4.4,0,4.1,0.1,3.9,0.3L0.2,4c-0.3,0.3-0.3,0.8,0,1l2.7,2.7C3.1,7.9,3.3,8,3.4,8C3.6,8,3.8,7.9,4,7.8l3.7-3.7 C7.9,3.9,8,3.6,8,3.3V0.7C8,0.3,7.7,0,7.3,0z M7.5,3.3c0,0.1-0.1,0.3-0.2,0.4L3.6,7.4c0,0-0.1,0.1-0.2,0.1c-0.1,0-0.1,0-0.2-0.1 L0.6,4.7c-0.1-0.1-0.1-0.2,0-0.3l3.7-3.7c0.1-0.1,0.3-0.2,0.4-0.2h2.6c0.1,0,0.3,0.1,0.3,0.2V3.3z M6.8,1.6C6.8,1.8,6.6,2,6.4,2 C6.2,2,6,1.8,6,1.6c0-0.2,0.2-0.4,0.4-0.4C6.6,1.3,6.8,1.4,6.8,1.6z"></path>
        </svg>
      </div>
      <span class="tags-title">{{ 'filter_posts' | lc }}</span>

      <div class="ico-arrow">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5" width="8px" height="8px">
          <path d="M0,5V0l4,2.5L0,5z"></path>
        </svg>
      </div>
    </button>

    <nav class="menu-tags">

      <div class="tags-bottom hidden">
        <ul class="menu">
          <li class="menu-item">
            <a class="menu-link js-tags-all" href="/{{ page.path }}">{{ 'all_posts' | lc }}</a>
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
  {% endif %}
</section>
