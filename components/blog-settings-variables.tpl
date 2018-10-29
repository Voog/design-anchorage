{% if site.data.article_settings.show_dates == false and article.data.article_settings.show_date == false %}
  {% assign toggle_article_date = "hide-article-date" %}
{% elsif site.data.article_settings.show_dates == false and article.data.article_settings.show_date == blank %}
  {% assign toggle_article_date = "hide-article-date" %}
{% elsif site.data.article_settings.show_dates == true and article.data.article_settings.show_date == false %}
  {% assign toggle_article_date = "hide-article-date" %}
{% elsif site.data.article_settings.show_dates == blank and article.data.article_settings.show_date == false %}
  {% assign toggle_article_date = "hide-article-date" %}
{% else %}
  {% assign toggle_article_date = "show-article-date" %}
{% endif %}

{% if site.data.article_settings.show_comments == false and article.data.article_settings.show_comments == false %}
  {% assign toggle_article_comments = "hide-article-comments" %}
{% elsif site.data.article_settings.show_comments == false and article.data.article_settings.show_comments == blank %}
  {% assign toggle_article_comments = "hide-article-comments" %}
{% elsif site.data.article_settings.show_comments == true and article.data.article_settings.show_comments == false %}
  {% assign toggle_article_comments = "hide-article-comments" %}
{% elsif site.data.article_settings.show_comments == blank and article.data.article_settings.show_comments == false %}
  {% assign toggle_article_comments = "hide-article-comments" %}
{% else %}
  {% assign toggle_article_comments = "show-article-comments" %}
{% endif %}

{% if site.data.article_settings.show_authors == false and article.data.article_settings.show_author == false %}
  {% assign toggle_article_author = "hide-article-author" %}
{% elsif site.data.article_settings.show_authors == false and article.data.article_settings.show_author == blank %}
  {% assign toggle_article_author = "hide-article-author" %}
{% elsif site.data.article_settings.show_authors == true and article.data.article_settings.show_author == false %}
  {% assign toggle_article_author = "hide-article-author" %}
{% elsif site.data.article_settings.show_authors == blank and article.data.article_settings.show_author == false %}
  {% assign toggle_article_author = "hide-article-author" %}
{% else %}
  {% assign toggle_article_author = "show-article-author" %}
{% endif %}
