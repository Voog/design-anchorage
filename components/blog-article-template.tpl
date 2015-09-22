<article class="blog-article">

  {% unless blog_article_page %}{% comment %}<!--Blog and news article header-->{% endcomment %}
    <header class="article-header">
      <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}, </time>
      <div class="article-author">{{ article.author.name }}</div>
      <h1 class="article-title">{% if blog-article-template == "blog_article_page" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
    </header>
  {% endunless %}

  {% if blog-article-template == "blog_article_page" %}{% comment %}<!--Blog article page excerpt and body-->{% endcomment %}
    <div class="article-content">
      <div class="article-excerpt content-area">{% if blog-article-template == "blog_article_page" %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
      <div class="article-body content-area">{% editable article.body %}</div>
    </div>
  {% elsif article.data.header_bg.imageSizes == nil or article.data.header_bg.imageSizes == "" %}{% comment %}<!--Blog and news excerpt when no article photo-->{% endcomment %}
    <div class="article-content">
      <div class="article-excerpt content-area">{% if blog-article-template == "blog_article_page" %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
    </div>
  {% endif %}

  {% unless blog_article_page %}{% comment %}<!--Blog and news user custom photo-->{% endcomment %}
    {% if article.data.header_bg.image and article.data.header_bg.image != "" %}
      {% for imageSize in article.data.header_bg.imageSizes %}
        {% if forloop.first %}
          <footer class="article-footer">
            {% comment %}<div class="background-image" style="background-image: url( {{ imageSize.url }} );"></div>{% endcomment %}
            <a href="{{ article.url }}" class="article-image-wrap">
              <img class="article-image" src="{{ imageSize.url }}" title="{{ article.title }}">
            </a>
          </footer>
          {% break %}
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endunless %}

</article>
