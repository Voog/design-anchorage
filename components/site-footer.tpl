<footer class="site-footer content-full content-bottom js-bg-picker-area">
  <div class="js-background-type {{ footer_bg_type }}">
    <div class="background-image js-background-image"></div>
    <div class="background-color js-background-color"></div>

    {% if site-footer == "blog_article_page" %}
      <div class="blog-article-nav js-background-type {{ blog_body_bg_type }}">
        {% capture dont_render %}
          {% comment %}Assign next and previous blog post values{% endcomment %}

          {% assign article_current = article.id %}
          {% assign article_prev_empty = true %}
          {% assign article_next_empty = true %}

          {% for article in blog.articles %}
            {% if article_current == article.id %}
              {% assign article_next = forloop.index0 | minus: 1 %}
              {% assign article_prev = forloop.index0 | plus: 1 %}
            {% endif %}
          {% endfor %}

          {% for blog in site.blogs %}
            {% for article in blog.articles %}
              {% if article_prev == forloop.index0 %}
                {% assign article_prev_empty = false %}
              {% endif %}

              {% if article_next == forloop.index0 %}
                {% assign article_next_empty = false %}
              {% endif %}
            {% endfor %}
          {% endfor %}
        {% endcapture %}

        {% if article_prev_empty == false %}
          <div class="{% if article_next_empty == true %}article-nav-full{% else %}article-nav-half{% endif %} article-nav-prev">
            {% for article in blog.articles %}
              {% if article_prev == forloop.index0 %}
                <a href="{{ article.url }}">
                  <div class="article-nav-inner">
                    <div class="article-nav-direction">{{ "previous" | lc }}</div>
                    <div class="article-nav-title">{{ article.title }}</div>
                  </div>
                </a>
              {% endif %}
            {% endfor %}
          </div>
        {% endif %}

        {% if article_next_empty == false %}
          <div class="{% if article_prev_empty == true %}article-nav-full{% else %}article-nav-half{% endif %} article-nav-next">
              {% for article in blog.articles %}
                {% if article_next == forloop.index0 %}
                  <a href="{{ article.url }}">
                    <div class="article-nav-inner">
                      <div class="article-nav-direction">{{ "next" | lc }}</div>
                      <div class="article-nav-title">{{ article.title }}</div>
                    </div>
                  </a>
                {% endif %}
              {% endfor %}
          </div>
        {% endif %}

      </div>
    {% endif %}

    <div class="footer-body content-area">
      {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="footer_bg" data-bg-picture-boolean="false" data-bg-default-image-color="rgb(255, 255, 255)" data-bg-color="{{ footer_bg_color }}" data-bg-color-data="{{ footer_bg_color_data_str | escape }}"></button>{% endif %}

      <div class="wrap">
        <div class="inner content-area">
          {% xcontent name="footer" %}
        </div>
      </div>
    </div>

    {% if site.branding.enabled %}
      <div class="voog-reference">
        {% loginblock %}
          <svg xmlns="http://www.w3.org/2000/svg" width="35px" height="8px" viewbox="0 0 35 8" class="ico-voog">
            <path d="M34.5,4 C34.5,4 34.5,4 34.5,4 C34.5,4 34.5,4.1 34.5,4.1 C34.5,4.4 34.5,4.6 34.4,4.8 C34.4,4.8 34.4,4.8 34.4,4.8 C34,6.6 32.3,8 30.3,8 C29.2,8 28.2,7.6 27.4,6.8 C27.4,6.8 27.4,6.8 27.4,6.8 C27.4,6.8 27.4,6.8 27.4,6.8 C26.7,6.1 26.2,5.1 26.2,4 C26.2,1.8 28.1,0 30.4,0 C31.5,0 32.5,0.4 33.3,1.2 C33.3,1.2 32.6,1.9 32.6,1.9 C32,1.3 31.2,1 30.4,1 C28.6,1 27.3,2.3 27.3,4 C27.3,4.7 27.5,5.3 27.9,5.9 C28,5.9 28.1,6 28.2,6.1 C28.2,6.1 28.2,6.1 28.2,6.1 C28.7,6.7 29.5,7 30.3,7 C31.9,7 33.2,5.9 33.4,4.5 C33.4,4.5 30.3,4.5 30.3,4.5 C30.3,4.5 30.3,3.5 30.3,3.5 C30.3,3.5 33.4,3.5 33.4,3.5 C33.4,3.5 34.1,3.5 34.1,3.5 C34.1,3.5 34.5,3.5 34.5,3.5 C34.5,3.7 34.5,3.8 34.5,4 ZM12.7,0 C12.7,0 12.7,1 12.7,1 C14.5,1 15.8,2.3 15.8,4 C15.8,5.7 14.5,7 12.7,7 C11,7 9.6,5.7 9.6,4 C9.6,4 8.6,4 8.6,4 C8.6,6.2 10.4,8 12.7,8 C15,8 16.9,6.2 16.9,4 C16.9,1.8 15,0 12.7,0 ZM7.5,2.4 C7.5,2.4 5.5,6.4 5.5,6.4 C5.4,6.7 5.1,7 4.8,7 C4.8,7 4.8,7 4.8,7 C4.5,7 4.2,6.7 4.1,6.4 C4.1,6.4 1.1,0.3 1.1,0.3 C1.1,0.3 0,0.3 0,0.3 C0,0.3 3.1,6.8 3.1,6.8 C3.5,7.6 4.1,8 4.8,8 C4.8,8 4.8,8 4.8,8 C5.5,8 6.1,7.6 6.5,6.8 C6.5,6.8 8.4,2.8 8.4,2.8 C8.4,2.8 8.4,2.8 8.4,2.8 C8.9,1.7 10,1 11.3,1 C11.3,1 11.3,0 11.3,0 C9.6,0 8.2,1 7.5,2.4 ZM1.9,0.3 C1.9,0.3 2,0.3 2,0.3 C2,0.3 2,0.6 2,0.6 C2,0.6 2.1,0.6 2.1,0.6 C2.1,0.6 2.1,0.3 2.1,0.3 C2.1,0.3 2.2,0.3 2.2,0.3 C2.2,0.3 2.2,0.3 2.2,0.3 C2.2,0.3 1.9,0.3 1.9,0.3 C1.9,0.3 1.9,0.3 1.9,0.3 ZM2.2,0.6 C2.2,0.6 2.2,0.6 2.2,0.6 C2.2,0.6 2.2,0.3 2.2,0.3 C2.2,0.3 2.2,0.3 2.2,0.3 C2.2,0.3 2.3,0.6 2.3,0.6 C2.3,0.6 2.4,0.6 2.4,0.6 C2.4,0.6 2.4,0.3 2.4,0.3 C2.4,0.3 2.4,0.3 2.4,0.3 C2.4,0.3 2.4,0.6 2.4,0.6 C2.4,0.6 2.5,0.6 2.5,0.6 C2.5,0.6 2.5,0.3 2.5,0.3 C2.5,0.3 2.4,0.3 2.4,0.3 C2.4,0.3 2.3,0.5 2.3,0.5 C2.3,0.5 2.3,0.5 2.3,0.5 C2.3,0.5 2.3,0.3 2.3,0.3 C2.3,0.3 2.2,0.3 2.2,0.3 C2.2,0.3 2.2,0.6 2.2,0.6 ZM21.5,0 C19.2,0 17.4,1.8 17.4,4 C17.4,6.2 19.2,8 21.5,8 C23.8,8 25.7,6.2 25.7,4 C25.7,1.8 23.8,0 21.5,0 ZM21.5,7 C19.8,7 18.4,5.6 18.4,4 C18.4,2.4 19.8,1 21.5,1 C23.2,1 24.6,2.4 24.6,4 C24.6,5.6 23.2,7 21.5,7 Z"></path>
          </svg>
        {% endloginblock %}
      </div>
    {% endif %}
  </div>
</footer>

{% include "menu-language-popover" %}
