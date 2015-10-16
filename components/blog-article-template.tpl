<article class="blog-article">
  {% comment %}<!--Blog and news article header-->{% endcomment %}
  {% unless blog_article_page %}
    <header class="article-header">
      <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}, </time>
      <div class="article-author">{{ article.author.name }}</div>
      <h1 class="article-title">{% if blog-article-template == "blog_article_page" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
      {% include "blog-article-tags" %}
    </header>
  {% endunless %}

  {% comment %}<!--Blog article page excerpt and body-->{% endcomment %}
  {% if blog-article-template == "blog_article_page" %}
    <div class="article-content">
      <div class="article-excerpt content-area" data-search-indexing-allowed="true">{% editable article.excerpt %}</div>
      <div class="article-body content-area" data-search-indexing-allowed="true">{% editable article.body %}</div>
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
    </div>
  {% endif %}
</article>
