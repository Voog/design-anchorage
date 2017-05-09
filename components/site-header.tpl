<header class="site-header content-full js-site-header js-bg-picker-area{% if photo_article %} photo-article{% endif %}">
  <div class="js-background-type {% if photo_article %}{{ article_header_bg_type }}{% else %}{{ header_bg_type }}{% endif %}" data-blog-bg-type="{{ header_bg_type }}" data-article-bg-type="{{ article_header_bg_type }}">
    <div class="background-image js-background-image"></div>
    <div class="background-color js-background-color"></div>

    <div class="header-top">
      <div class="wrap js-header-top-wrap">

        <div class="header-left js-header-left">
          <div class="header-title content-area">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
        </div>

        <div class="header-right js-header-right">
          {% include "menu-main" %}

          <div class="site-options">
            <div class="visibility-lrg">
              {% include "menu-language" %}

              {% if site.search.enabled %}
                <button class="search-btn search-open-btn js-search-toggle-btn js-prevent-sideclick">
                  <svg width="18px" height="18px" viewBox="0 0 18 18"  xmlns="http://www.w3.org/2000/svg">
                    <path d="M13,11 L12,11 L12,11 C13,10 13,8 13,7 C13,3 10,0 7,0 C3,0 0,3 0,7 C0,10 3,13 7,13 C8,13 10,13 11,12 L11,12 L11,13 L16,18 L18,16 L13,11 ZM7,11 C4,11 2,9 2,7 C2,4 4,2 7,2 C9,2 11,4 11,7 C11,9 9,11 7,11 Z"></path>
                  </svg>

                </button>
              {% endif %}
            </div>

            {% if render_mobile_menu_btn %}
              <button class="mobile-menu-toggler js-prevent-sideclick">
                <span></span>
              </button>
            {% endif %}
          </div>

          {% include "site-search" %}

        </div>

      </div>
    </div>
    <div class="header-bottom">
      {% if editmode %}
        {% if blog_article_page %}
          <button class="voog-bg-picker-btn js-background-settings{% unless photo_article %} is-hidden{% endunless %}" data-bg-key="header_bg" data-bg-picture-boolean="true" data-bg-default-image-color="rgb(0, 0, 0)" data-target-width="2048" data-bg-image="{{ article_header_bg_image }}" data-bg-image-sizes="{{ article_header_bg_image_sizes_str | escape }}" data-bg-color="{{ article_header_bg_color }}" data-bg-color-data="{{ article_header_bg_color_data_str | escape }}"></button>
          <div class="article-types-toggle">
            <button class="type-btn js-type-btn{% unless photo_article %} is-active{% endunless %}" data-article-type="text-article">Text</button>
            <button class="type-btn js-type-btn{% if photo_article %} is-active{% endif %}" data-article-type="photo-article">Photo</button>
          </div>
        {% else %}
          <button class="voog-bg-picker-btn js-background-settings" data-bg-key="header_bg" data-bg-picture-boolean="true" data-bg-default-image-color="{% if front_page %}rgb(142, 156, 169){% else %}rgb(41, 42, 39){% endif %}" data-target-width="600" data-bg-image="{{ header_bg_image }}" data-bg-image-sizes="{{ header_bg_image_sizes_str | escape }}" data-bg-color="{{ header_bg_color }}" data-bg-color-data="{{ header_bg_color_data_str | escape }}"></button>
        {% endif %}
      {% endif %}

      <div class="header-bottom-inner">

        {% if front_page %}
          <div class="wrap">
            <div class="header-body content-area" {{ edy_intro_edit_text }}>
              {% content name="header" %}
            </div>
          </div>
        {% elsif blog_article_page %}
          <div class="wrap js-toggle-article-type{% if photo_article %} is-photoheader{% endif %}">
            <div class="header-body content-area js-article-header-title-wrap">
              {% comment %}Photo article header components{% endcomment %}
              {% if photo_article %}<h1 class="article-title js-article-title js-slide-to-article">{% if editmode %}{% editable article.title %}{% else %}{{ article.title }}{% endif %}</h1>{% endif %}

              {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

              {% if article_year == current_year %}
                {% assign article_date_format = "long_without_year" %}
              {% else %}
                {% assign article_date_format = "long" %}
              {% endif %}

              <time class="article-date js-photo-article-component{% unless photo_article %} is-hidden{% endunless %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}, </time>
              <div class="article-author js-photo-article-component{% unless photo_article %} is-hidden{% endunless %}">{{ article.author.name }}</div>

              {% comment %}Text article header components{% endcomment %}
              <h1 class="blog-title js-text-article-component{% if photo_article %} is-hidden{% endif %}"><a href="{{ page.url }}">{{ page.title }}</a></h1>
            </div>
          </div>
        {% else %}
          <div class="wrap">
            <div class="header-body content-area" {{ edy_intro_edit_text }}>
              {% contentblock name="header" publish_default_content="true" %}<h1 style="text-align: center;">{{ page.title }}</h1>{% endcontentblock %}
            </div>
          </div>
        {% endif %}

      </div>
    </div>
  </div>
</header>
