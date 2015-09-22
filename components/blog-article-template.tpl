<article class="blog-article">
  {% comment %}<!--Blog and news article header-->{% endcomment %}
  {% unless blog_article_page %}
    <header class="article-header">
      <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}, </time>
      <div class="article-author">{{ article.author.name }}</div>
      <h1 class="article-title">{% if blog-article-template == "blog_article_page" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
    </header>
  {% endunless %}

  {% comment %}<!--Blog article page excerpt and body-->{% endcomment %}
  {% if blog-article-template == "blog_article_page" %}
    <div class="article-content">
      <div class="article-excerpt content-area">{% if blog-article-template == "blog_article_page" %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
      <div class="article-body content-area">{% editable article.body %}</div>
    </div>
  {% comment %}<!--Blog and news excerpt when no article photo-->{% endcomment %}
  {% elsif photo_article == false %}
    <div class="article-content">
      <div class="article-excerpt content-area">{{ article.excerpt }}</div>
    </div>
  {% endif %}

  {% comment %}<!--Blog and news user custom photo-->{% endcomment %}
  {% unless blog_article_page %}
    {% if article.data.photo_article_state %}
      <footer class="article-footer">
        <div class="article-image">
          <div class="background-image" style="background-image: url({{ article.data.header_bg.image }});"></div>
          <a href="{{ article.url }}" class="stretch"></a>
        </div>
      </footer>
    {% endif %}
  {% endunless %}

</article>
