<article class="blog-article">
  {% unless post_page %}
  <header class="article-header">
    <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: 'long' }}, </time>
    <div class="article-author">{{ article.author.name }}</div>
    <h1 class="article-title">{% if blog-article-template == "article_page" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
  </header>

  {% endunless %}

  <div class="article-content">
    <div class="article-excerpt content-area">{% if blog-article-template == 'article_page' %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
    {% if blog-article-template == 'article_page' %}<div class="article-body content-area">{% editable article.body %}</div>{% endif %}
  </div>

  {% unless post_page %}
    <footer class="article-footer">
      {% for imageSize in article.data.content_top_bg.imageSizes %}
      {% if forloop.first %}
        <div class="article-image">
          <div class="background-image" style="background-image: url( {{ imageSize.url }} );"></div>
        </div>
      {% else %}

      {% endif %}
      {% endfor %}
    </footer>
  {% endunless %}
</article>
