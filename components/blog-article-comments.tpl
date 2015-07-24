<section id="article-comments" class="article-comments content-area js-comments js-voog-comments-modal">
  <div class="comments-body">
    <header class="comments-header">
      <h1 class="comments-title">{{ 'post_has_replies' | lcc: article.comments_count }}</h1>
    </header>

    <div class="comment-form{% unless comment.valid? %} form_with_errors{% endunless %}">
      {% commentform %}
        {% unless comment.valid? %}
            {% for error in comment.errors %}
              {% if error == "comment_author_blank" %}{% assign comment_name_error = true %}{% endif %}
              {% if error == "comment_email_blank" %}{% assign comment_email_error = true %}{% endif %}
              {% if error == "comment_body_blank" %}{% assign comment_body_error = true %}{% endif %}
            {%endfor %}
        {% endunless %}

        <div class="form_area">
          <div class="form_fields">
            <div class="form_field">
              <label for="comment-name">{% if comment_name_error %}<span class="form_field_error">{{ 'comment_author_blank' | lc }}</span>{% endif %}</label>
              <input id="comment-name" class="form_field_textfield form_field_size_medium" name="comment[author]" placeholder="{{ 'name' | lc }}" value="{{ comment.author }}">
            </div>

            <div class="form_field">
              <label for="comment-email">{% if comment_email_error %}<span class="form_field_error">{{ 'comment_email_blank' | lc }}</span>{% endif %}</label>
              <input id="comment-email" class="form_field_textfield form_field_size_medium" name="comment[author_email]" placeholder="{{ 'email' | lc }}" value="{{ comment.author_email }}">
            </div>

            <div class="form_field">
              <label for="comment-body">{% if comment_body_error %}<span class="form_field_error">{{ 'comment_body_blank' | lc }}</span>{% endif %}</label>
              <textarea id="comment-body" class="form_field_textarea form_field_size_large" name="comment[body]" placeholder="{{ 'comment' | lc }}" rows="1">{{ comment.body }}</textarea>
            </div>
          </div>

          <div class="form_submit">
            <input type="submit" value="{{ 'submit' | lc }}">
          </div>
        </div>
      {% endcommentform %}
    </div>

    {% if article.comments_count > 0 %}
      <div class="comments-title">{{ "comments_for_count" | lc }} <span class="voog-site-blog-comments-count">({{ article.comments_count }})</span></div>
      {% for comment in article.comments %}
        <article class="comment edy-site-blog-comment">
          <span class="comment-body">{{ comment.body_html }}</span>
          <span class="comment-author">{{ comment.author }} · </span>
          <span class="comment-date">{{ comment.created_at | format_date: 'long' }}</span>
          <span class="comment-delete">{% removebutton %}</span>
        </article>
      {% endfor %}
    {% endif %}
  </div>

  <div class="comments-close">
    <div class="btn-close comments-btn comments-close-btn js-comments-close-btn"><div class="xcross xcross-l"><div class="xcross xcross-r"></div></div></div>
  </div>

</section>
