<header class="site-header content-full content-top  js-content-top">

  <div class="background-image stretch"></div>
  <div class="background-color stretch"></div>

  <div class="header-top js-background-type {{ content_top_bg_type }}">
    <div class="wrap">

      <div class="header-left">
        <div class="header-title">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
      </div>

      <div class="header-right">
        {% include 'menu-main' %}

        <div class="site-options">
          <div class="visibility-lrg">
            {% include 'menu-language' %}

            {% if site.search.enabled %}
              <button class="search-btn search-open-btn js-search-open-btn">
                <svg width="20px" height="20px" viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg">
                  <path d="M15.323,13.712 C15.323,14.194 15.135,14.647 14.794,14.988 C14.453,15.328 14,15.516 13.519,15.516 C13.037,15.516 12.584,15.328 12.243,14.988 C12.243,14.988 9.136,11.881 9.136,11.881 C8.279,12.318 7.323,12.588 6.294,12.588 C2.818,12.588 0,9.77 0,6.294 C0,2.818 2.818,0 6.294,0 C9.77,0 12.588,2.818 12.588,6.294 C12.588,7.424 12.266,8.47 11.745,9.387 C11.745,9.387 14.794,12.437 14.794,12.437 C15.135,12.777 15.323,13.23 15.323,13.712 ZM6.295,1.516 C3.655,1.516 1.514,3.656 1.514,6.297 C1.514,8.937 3.655,11.078 6.295,11.078 C8.936,11.078 11.076,8.937 11.076,6.297 C11.076,3.656 8.936,1.516 6.295,1.516 Z "></path>
                </svg>
              </button>

              <button class="search-btn search-close-btn js-search-close-btn">
                <svg width="20px" height="20px" viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg">
                  <path d="M15.323,13.712 C15.323,14.194 15.135,14.647 14.794,14.988 C14.453,15.328 14,15.516 13.519,15.516 C13.037,15.516 12.584,15.328 12.243,14.988 C12.243,14.988 9.136,11.881 9.136,11.881 C8.279,12.318 7.323,12.588 6.294,12.588 C2.818,12.588 0,9.77 0,6.294 C0,2.818 2.818,0 6.294,0 C9.77,0 12.588,2.818 12.588,6.294 C12.588,7.424 12.266,8.47 11.745,9.387 C11.745,9.387 14.794,12.437 14.794,12.437 C15.135,12.777 15.323,13.23 15.323,13.712 ZM6.295,1.516 C3.655,1.516 1.514,3.656 1.514,6.297 C1.514,8.937 3.655,11.078 6.295,11.078 C8.936,11.078 11.076,8.937 11.076,6.297 C11.076,3.656 8.936,1.516 6.295,1.516 Z "></path>
                </svg>
              </button>
            {% endif %}
          </div>

          <a href="#" class="mobile-menu-toggler"><span></span></a>

        </div>

        {% include "site-search" %}

      </div>

    </div>
  </div>
  <div class="header-bottom js-background-type {{ content_top_bg_type }}">
    {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}
    <div class="header-bottom-inner">

      {% if front_page %}
        <div class="wrap">
          <div class="header-body content-formatted">
            {% content name="header" %}
          </div>
        </div>
      {% elsif blog_article_page %}
        {% if editmode %}
          <div class="wrap is-photoheader">
            <div class="header-body">
              <h1 class="article-title">{% if editmode %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
              <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | date: "%d. %B %Y" }}, </time>
              <div class="article-author">{{ article.author.name }}</div>
            </div>
          </div>
        {% elsif article.data.content_top_bg.imageSizes == nil or article.data.content_top_bg.imageSizes == "" %}
          <div class="wrap">
            <div class="header-body">
              <h1><a href="{{ article.url }}">{{ article.title }}</a></h1>
            </div>
          </div>
        {% else %}
          <div class="wrap is-photoheader">
            <div class="header-body">
              <h1 class="article-title">{% if editmode %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
              <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | date: "%d. %B %Y" }}, </time>
              <div class="article-author">{{ article.author.name }}</div>
            </div>
          </div>
        {% endif %}
      {% else %}
        <div class="wrap">
          <div class="header-body">
            {% for item in site.menuitems_with_hidden %}
              {% if item.selected? %}
                <h1><a href="{{ item.url }}">{{ item.title }}</a></h1>
              {% endif %}
            {% endfor %}
          </div>
        </div>
      {% endif %}

    </div>
  </div>

</header>
