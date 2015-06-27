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

        {% if site.search.enabled %}

        <div class="search-holder">
          <a href="#" class="search-toggler js-search-toggler">
            <svg version="1.1" baseProfile="full" height="28px" width="28px" viewbox="0 0 56 56">
              <path fill="rgb( 0, 0, 0 )"
               d="M35.069,30.578 C35.069,30.578 27.3,22.809 27.3,22.809 C28.778,20.502 29.6469999999999,17.767 29.6469999999999,14.823 C29.6469999999999,6.637 23.011,0 14.8230000000001,0 C6.63699999999994,0 0,6.637 0,14.823 C0,23.011 6.63699999999994,29.647 14.8230000000001,29.647 C17.7670000000001,29.647 20.502,28.779 22.808,27.3 C22.808,27.3 30.578,35.069 30.578,35.069 C31.1980000000001,35.69 32.011,36 32.8230000000001,36 C33.6369999999999,36 34.4490000000001,35.69 35.069,35.069 C36.3099999999999,33.83 36.3099999999999,31.817 35.069,30.578 ZM4.2349999999999,14.823 C4.2349999999999,8.986 8.9849999999999,4.235 14.8230000000001,4.235 C20.6610000000001,4.235 25.412,8.986 25.412,14.823 C25.412,20.661 20.6610000000001,25.412 14.8230000000001,25.412 C8.9849999999999,25.412 4.2349999999999,20.661 4.2349999999999,14.823 Z "/>
            </svg>
          </a>
          {% include "site-search" %}
        </div>
        {% endif %}

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
