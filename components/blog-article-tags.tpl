{% if editmode %}
  <div class="blog-tags">
    <div class="tags-editor">{% editable article.tags %}</div>
  </div>
{% else %}
  {% unless article.tags == empty %}
    <div class="blog-tags">
{% comment %}      {% if blog_article_page %}
        <div class="tags-icon">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 8" width="8px" height="8px">
            <path d="M7.3,0H4.7C4.4,0,4.1,0.1,3.9,0.3L0.2,4c-0.3,0.3-0.3,0.8,0,1l2.7,2.7C3.1,7.9,3.3,8,3.4,8C3.6,8,3.8,7.9,4,7.8l3.7-3.7 C7.9,3.9,8,3.6,8,3.3V0.7C8,0.3,7.7,0,7.3,0z M7.5,3.3c0,0.1-0.1,0.3-0.2,0.4L3.6,7.4c0,0-0.1,0.1-0.2,0.1c-0.1,0-0.1,0-0.2-0.1 L0.6,4.7c-0.1-0.1-0.1-0.2,0-0.3l3.7-3.7c0.1-0.1,0.3-0.2,0.4-0.2h2.6c0.1,0,0.3,0.1,0.3,0.2V3.3z M6.8,1.6C6.8,1.8,6.6,2,6.4,2 C6.2,2,6,1.8,6,1.6c0-0.2,0.2-0.4,0.4-0.4C6.6,1.3,6.8,1.4,6.8,1.6z"></path>
          </svg>
        </div>
      {% endif %}{% endcomment %}

      <ul class="menu">
        {% for tag in article.tags %}
          <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
        {% endfor %}
      </ul>
    </div>
  {% endunless %}
{% endif %}
