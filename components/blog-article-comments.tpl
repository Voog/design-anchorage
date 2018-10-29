<section class="article-comments js-comments js-prevent-sideclick{% unless comment.valid? %} open{% endunless %} {{toggle_article_comments}}">
  <div class="comments-body light-background">
    <header class="comments-header">
      <h1 class="comments-title">{{ "add_a_comment" | lc }}</h1>
    </header>

    <div class="comment-form content-area{% unless comment.valid? %} form_with_errors{% endunless %}">
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
              <label for="comment-name">{% if comment_name_error %}<span class="form_field_error">{{ "comment_author_blank" | lc }}</span>{% endif %}</label>
              <input id="comment-name" class="form_field_textfield form_field_size_large" name="comment[author]" placeholder="{{ "name" | lc }}" value="{{ comment.author }}">
            </div>

            <div class="form_field">
              <label for="comment-email">{% if comment_email_error %}<span class="form_field_error">{{ "comment_email_blank" | lc }}</span>{% endif %}</label>
              <input id="comment-email" class="form_field_textfield form_field_size_large" name="comment[author_email]" placeholder="{{ "email" | lc }}" value="{{ comment.author_email }}">
            </div>

            <div class="form_field">
              <label for="comment-body">{% if comment_body_error %}<span class="form_field_error">{{ "comment_body_blank" | lc }}</span>{% endif %}</label>
              <textarea id="comment-body" class="form_field_textarea form_field_size_large js-autogrow-textarea" name="comment[body]" placeholder="{{ "comment" | lc }}" rows="1">{{ comment.body }}</textarea>
            </div>
          </div>

          <div class="form_submit">
            <input type="submit" value="{{ "submit" | lc }}">
          </div>
        </div>
      {% endcommentform %}
    </div>

    {% if article.comments_count > 0 %}
      <div class="comments-title">{{ "comments_for_count" | lc }} <span class="comments-count">({{ article.comments_count }})</span></div>
      <div>
        {% for comment in article.comments %}
          <div class="comment edy-site-blog-comment">
            <span class="comment-body">{{ comment.body_html }}</span>
            <span class="comment-author">{{ comment.author }} · </span>
            <span class="comment-date">{{ comment.created_at | format_date: "long" }}</span>
            <span class="comment-delete">{% removebutton %}</span>
          </div>
        {% endfor %}
      </div>
    {% endif %}

    <div class="comments-close js-background-type {{ blog_body_bg_type }}">
      <div class="btn-close comment-btn comments-close-btn js-comments-toggle-btn">
        <svg class="ico-close" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
          <path d="M15.778,1.636 L9.414,8.000 L15.778,14.364 L14.364,15.778 L8.000,9.414 L1.636,15.778 L0.222,14.364 L6.586,8.000 L0.222,1.636 L1.636,0.222 L8.000,6.586 L14.364,0.222 L15.778,1.636 Z" class="cls-1"/>
        </svg>
      </div>
    </div>
  </div>
</section>
