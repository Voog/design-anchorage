{% assign show_branding = false -%}

{% if site.branding.enabled and page.path == blank -%}
  {% assign show_branding = true -%}
{% endif -%}

{% if editmode or footer_has_content or show_branding %}
  <footer class="site-footer content-full content-bottom js-bg-picker-area">
    <div class="js-background-type {{ footer_bg_type }}">
      <div class="background-image js-background-image"></div>
      <div class="background-color js-background-color"></div>

      {% if site-footer == "blog_article_page" %}
        <div class="blog-article-nav js-background-type {{ blog_body_bg_type }}">
          {% if article.older %}
            <div class="{% if article.newer %}article-nav-half{% else %}article-nav-full{% endif %} article-nav-prev">
              <a href="{{ article.older.url }}">
                <div class="article-nav-inner">
                  <div class="article-nav-direction">{{ "previous" | lc }}</div>
                  <div class="article-nav-title">{{ article.older.title }}</div>
                </div>
              </a>
            </div>
          {% endif %}

          {% if article.newer %}
            <div class="{% if article.older %}article-nav-half{% else %}article-nav-full{% endif %} article-nav-next">
              <a href="{{ article.newer.url }}">
                <div class="article-nav-inner">
                  <div class="article-nav-direction">{{ "next" | lc }}</div>
                  <div class="article-nav-title">{{ article.newer.title }}</div>
                </div>
              </a>
            </div>
          {% endif %}
        </div>
      {% endif %}

      <div class="footer-body content-area">
        {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-key="footer_bg" data-bg-picture-boolean="false" data-bg-default-image-color="rgb(255, 255, 255)" data-bg-color="{{ footer_bg_color }}" data-bg-color-data="{{ footer_bg_color_data_str | escape }}"></button>{% endif %}

        <div class="wrap">
          {%- assign footer_content_title = "footer" | lce -%}
          {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
          <div class="inner content-area">{% xcontent name="footer" title=footer_content_title title_tooltip=footer_content_title_tooltip %}</div>
        </div>
      </div>

      {% if show_branding %}
        <div class="voog-reference{% unless editmode or footer_has_content %} voog-reference-with-padding{% endunless %}">
          {% loginblock %}
            {{ "footer_login_link" | lc }}
          {% endloginblock %}
        </div>
      {% endif %}
    </div>
  </footer>
{% endif %}

{% include "menu-language-popover" %}

