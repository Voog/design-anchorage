<article class="blog-article">
  {% comment %}<!--Blog and news article header-->{% endcomment %}
  {% unless blog_article_page %}
    <header class="article-header">
      {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

      {% if article_year == current_year %}
        {% assign article_date_format = "long_without_year" %}
      {% else %}
        {% assign article_date_format = "long" %}
      {% endif %}

      <time class="article-date{% if show_article_date == false %} hide-article-date{% endif %}{% if article_data_show_date_defined != true %} site-data{% endif %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
      <div class="article-author{% if show_article_author == false %} hide-article-author{% endif %}{% if article_data_show_author_defined != true %} site-data{% endif %}">{{ article.author.name }}</div>
      <h1 class="article-title">{% if blog-article-template == "blog_article_page" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
      {% include "blog-article-tags" %}
    </header>
  {% endunless %}

  {% comment %}<!--Blog article page excerpt and body-->{% endcomment %}
  {% if blog-article-template == "blog_article_page" %}
    <div class="article-content">
      <div class="article-excerpt content-area" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
      <div class="article-body content-area" data-search-indexing-allowed="true">{% editable article.body %}</div>
      {%- assign bottom_content_title = "additional_content" | lce -%}
      {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
      <div class="article-body content-area" data-search-indexing-allowed="true">{% content name="additional_body" bind="Article" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}</div>
    </div>
  {% comment %}<!--Blog and news excerpt when no article photo-->{% endcomment %}
  {% else %}
    <div class="article-content">
      <div class="article-excerpt content-area">{{ article.excerpt }}</div>
      {% if article.data.photo_article_state and article.data.header_bg != "" and article.data.header_bg != nil %}
        <div class="article-image">
          <a href="{{ article.url }}" class="background-image" style="background-image: url({{ article.data.header_bg.image }});"></a>
        </div>
      {% endif %}
      <a class="article-read-more-btn" href="{{ article.url }}">{{ "read_more" | lc }}</a>
    </div>
  {% endif %}
</article>
