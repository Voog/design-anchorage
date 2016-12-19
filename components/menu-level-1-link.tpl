<li class="js-prevent-link-click{% if item.selected? %} selected{% endif %}{% if item.current? %} current{% endif %}{% if render_hidden_categories == true and item.layout_title == product_list_layout %}{% if hide_categories_from_main_menu %} is-hidden{% endif %} js-menu-item-category{% endif %}">
  <a{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %} href="{{ item.url }}">{{ item.title }}</a>
</li>
