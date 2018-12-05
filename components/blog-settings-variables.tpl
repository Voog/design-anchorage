{% assign article_data_show_date_defined = false %}
{% if article.data.article_settings.show_date == true or article.data.article_settings.show_date == false %}
  {% assign show_article_date = article.data.article_settings.show_date %}
  {% assign article_data_show_date_defined = true %}
{% elsif site.data.article_settings.show_dates == false %}
  {% assign show_article_date = false %}
{% else %}
  {% assign show_article_date = true %}
{% endif %}

{% if article.data.article_settings.show_comments == true or article.data.article_settings.show_comments == false %}
  {% assign show_article_comments = article.data.article_settings.show_comments %}
{% elsif site.data.article_settings.show_comments == false %}
  {% assign show_article_comments = false %}
{% else %}
  {% assign show_article_comments = true %}
{% endif %}

{% assign article_data_show_author_defined = false %}
{% if article.data.article_settings.show_author == true or article.data.article_settings.show_author == false %}
  {% assign show_article_author = article.data.article_settings.show_author %}
  {% assign article_data_show_author_defined = true %}
{% elsif site.data.article_settings.show_authors == false %}
  {% assign show_article_author = false %}
{% else %}
  {% assign show_article_author = true %}
{% endif %}
