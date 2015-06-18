<header class="site-header content-full content-top  js-content-top js-background-type {{ content_top_bg_type }}">

  <div class="background-image stretch"></div>
  <div class="background-color stretch"></div>


  <div class="header-top">
    <div class="wrap">

      <div class="header-left">
        <div class="header-title">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
      </div>


      <div class="header-right">
        {% include 'menu-main' %}
        <div class="site-options">
          {% include 'menu-language' %}
          <a href="#" class="mobile-menu-toggler"><span></span></a>
          {% if site.search.enabled %}
          <a href="#" class="mobile-search-toggler"></a>
          {% endif %}
        </div>
      </div>

    </div>
  </div>
  <div class="header-bottom">
    {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}
    <div class="header-bottom-inner">
      <div class="wrap">
        <div class="header-body content-formatted">

          {% if front_page %}
            {% content name="header" %}
          {% elsif post_page %}
            <h1 class="article-title">{% if editmode %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
            <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}, </time>
            <div class="article-author">{{ article.author.name }}</div>

          {% else %}
            <h1>{{ page.title }}</h1>
          {% endif %}
        </div>
      </div>
    </div>
  </div>

</header>
