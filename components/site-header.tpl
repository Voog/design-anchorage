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
                <button class="search-btn js-search-toggle-btn js-prevent-sideclick">
                  <svg width="20px" height="20px" viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg">
                    <path d="M15.323,13.712 C15.323,14.194 15.135,14.647 14.794,14.988 C14.453,15.328 14,15.516 13.519,15.516 C13.037,15.516 12.584,15.328 12.243,14.988 C12.243,14.988 9.136,11.881 9.136,11.881 C8.279,12.318 7.323,12.588 6.294,12.588 C2.818,12.588 0,9.77 0,6.294 C0,2.818 2.818,0 6.294,0 C9.77,0 12.588,2.818 12.588,6.294 C12.588,7.424 12.266,8.47 11.745,9.387 C11.745,9.387 14.794,12.437 14.794,12.437 C15.135,12.777 15.323,13.23 15.323,13.712 ZM6.295,1.516 C3.655,1.516 1.514,3.656 1.514,6.297 C1.514,8.937 3.655,11.078 6.295,11.078 C8.936,11.078 11.076,8.937 11.076,6.297 C11.076,3.656 8.936,1.516 6.295,1.516 Z "></path>
                  </svg>
                </button>
              {% endif %}
            </div>

            <button class="mobile-menu-toggler js-prevent-sideclick">
              <span></span>
            </button>

          </div>

          {% include "site-search" %}

        </div>

      </div>
    </div>
    <div class="header-bottom">
      {% if editmode %}
        {% if blog_article_page %}
          <button class="voog-bg-picker-btn js-background-settings{% unless photo_article %} is-hidden{% endunless %}" data-bg-key="header_bg" data-bg-picture-boolean="true" data-target-width="2048" data-bg-image="{{ article_header_bg_image }}" data-bg-image-sizes="{{ article_header_bg_image_sizes_str | escape }}" data-bg-color="{{ article_header_bg_color }}" data-bg-color-data="{{ article_header_bg_color_data_str | escape }}"></button>
          <div class="article-types-toggle">
            <button class="type-btn js-type-btn{% unless photo_article %} is-active{% endunless %}" data-article-type="text-article">Text</button>
            <button class="type-btn js-type-btn{% if photo_article %} is-active{% endif %}" data-article-type="photo-article">Photo</button>
          </div>
        {% else %}
          <button class="voog-bg-picker-btn js-background-settings" data-bg-key="header_bg" data-bg-picture-boolean="true" data-target-width="600" data-bg-image="{{ header_bg_image }}" data-bg-image-sizes="{{ header_bg_image_sizes_str | escape }}" data-bg-color="{{ header_bg_color }}" data-bg-color-data="{{ header_bg_color_data_str | escape }}"></button>
        {% endif %}
      {% endif %}

      <div class="header-bottom-inner">

        {% if front_page %}
          <div class="wrap">
            <div class="header-body content-area">
              {% content name="header" %}
            </div>
          </div>
        {% elsif blog_article_page %}
          <div class="wrap js-toggle-article-type{% if photo_article %} is-photoheader{% endif %}">
            <div class="header-body content-area js-article-header-title-wrap">
              {% comment %}Photo article header components{% endcomment %}
              {% if photo_article %}<h1 class="article-title js-article-title">{% if editmode %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>{% endif %}
              <time class="article-date js-photo-article-component{% unless photo_article %} is-hidden{% endunless %}" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}, </time>
              <div class="article-author js-photo-article-component{% unless photo_article %} is-hidden{% endunless %}">{{ article.author.name }}</div>

              {% comment %}Text article header components{% endcomment %}
              <h1 class="blog-title js-text-article-component{% if photo_article %} is-hidden{% endif %}"><a href="{{ page.url }}">{{ page.title }}</a></h1>
            </div>
          </div>
        {% else %}
          <div class="wrap">
            <div class="header-body content-area">
              {% contentblock name="header" publish_default_content="true" %}<h1>{{ page.title }}</h1>{% endcontentblock %}
            </div>
          </div>
        {% endif %}

      </div>
    </div>
  </div>
</header>
