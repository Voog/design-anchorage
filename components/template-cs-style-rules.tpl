body {
  font-family: var(--main-font-family);
}

.dark-background {
  color: var(--third-color);
}
.dark-background .content-area h1,
.dark-background .content-area h2,
.dark-background .content-area h3,
.dark-background .content-area h4,
.dark-background .content-area h5,
.dark-background .content-area h6,
.dark-background .content-area p,
.dark-background .content-area ul,
.dark-background .content-area ol,
.dark-background .content-area dl,
.dark-background .content-area pre,
.dark-background .content-area table {
  color: var(--third-color);
}
.site-footer .dark-background a,
.site-footer .dark-background b {
  color: var(--third-color);
}
.dark-background .header-title a {
  color: var(--third-color);
}
.dark-background .menu li a {
  color: var(--third-color);
}
.dark-background .menu li.selected a {
  color: var(--third-color);
}
.dark-background .lang-title {
  color: var(--third-color);
}
.dark-background .lang-menu.lang-menu-bilingual .lang-title a {
  color: var(--third-color);
}
.dark-background .lang-menu.lang-menu-bilingual .lang-title a.is-active, .dark-background .lang-menu.lang-menu-bilingual .lang-title a:hover {
  color: var(--third-color);
}
.dark-background .lang-menu.lang-menu-bilingual .lang-title a.selected {
  color: var(--third-color);
}
.dark-background .voog-reference svg path {
  fill: var(--third-color);
}
.dark-background .site-options .search-btn svg path {
  fill: var(--third-color);
}
@media screen and (max-width: 640px) {
  .search-open .dark-background .site-options .search-btn svg path {
    fill: var(--primary-color);
  }
}

.light-background {
  color: var(--secondary-color);
}
.light-background h1, .light-background h2, .light-background h3, .light-background h4 {
  color: var(--secondary-color);
}
.site-header .light-background a {
  color: var(--secondary-color);
}
.site-header .light-background .header-title a {
  color: var(--secondary-color);
}
.site-header .light-background .menu li a {
  color: var(--secondary-color);
}
.site-header .light-background .menu li a:hover {
  color: var(--secondary-color);
}
.site-header .light-background .menu li.selected a {
  color: var(--secondary-color);
}
.site-footer .light-background {
  color: var(--primary-color);
}
.light-background .lang-title {
  color: var(--secondary-color);
}
.light-background .lang-menu-bilingual .lang-title a:hover {
  color: var(--secondary-color);
}
.light-background .lang-menu-bilingual .lang-title a.selected {
  color: var(--secondary-color);
}
.light-background .site-options .search-btn svg path {
  fill: var(--secondary-color);
}

.blog-news-page .article-title a {
  color: var(--secondary-color);
}
.blog-news-page .article-author,
.blog-news-page .article-date {
  color: var(--secondary-color);
}
.dark-background .blog-news-page .article-author, .dark-background
.blog-news-page .article-date {
  color: rgba(255, 255, 255, 0.35);
}
.blog-news-page .article-excerpt {
  color: var(--primary-color);
}
@media screen and (max-width: 640px) {
  .blog-news-page .article-header {
    margin: 0;
  }
}
.blog-news-page .articles-listing .blog-article .article-date {
  color: var(--secondary-color);
}
.blog-news-page .dark-background .article-author,
.blog-news-page .dark-background .article-date,
.blog-news-page .dark-background .articles-listing .article-date {
  color: rgba(255, 255, 255, 0.35);
}

.blog-article-page .article-excerpt,
.blog-article-page .article-body {
  color: var(--primary-color);
}
.blog-article-page .comments-title {
  color: var(--secondary-color);
}
.blog-article-page .dark-background .comments-title {
  color: var(--third-color);
}
.blog-article-page .main-content .article-author,
.blog-article-page .main-content .article-date {
  color: var(--secondary-color);
}
.blog-article-page .dark-background .article-author,
.blog-article-page .dark-background .article-date {
  color: var(--third-color);
}
.blog-article-page .light-background .article-author,
.blog-article-page .light-background .article-date {
  color: var(--secondary-color);
}

@media screen and (max-width: 640px) {
  .comments-open .article-comments .comments-body {
    background-color: var(--third-color);
  }
}
.article-comments .comments-body .comments-title {
  color: var(--secondary-color);
}
.article-comments .comments-body .comments-title .comments-count {
  color: var(--secondary-color);
}
.article-comments .comment {
  color: var(--primary-color);
}
.article-comments .comment .comment-author,
.article-comments .comment .comment-date {
  color: var(--secondary-color);
}
.article-comments .comments-close.dark-background .btn-close {
  background-color: var(--third-color);
}
.article-comments .comments-close.dark-background .btn-close .ico-close {
  fill: var(--secondary-color);
}
.article-comments .comments-close .btn-close {
  background-color: var(--secondary-color);
}
@media screen and (max-width: 850px) {
  .article-comments .comments-close .btn-close {
    background-color: var(--third-color);
  }
}
.article-comments .comments-close .btn-close .ico-close {
  fill: var(--third-color);
}
@media screen and (max-width: 850px) {
  .article-comments .comments-close .btn-close .ico-close {
    fill: var(--primary-color);
  }
  .article-comments .comments-close .btn-close .ico-close:hover {
    fill: var(--primary-color);
  }
}

.no-svg .toggle-sub-menu:before {
  border-color: transparent transparent transparent var(--secondary-color);
}
.svg .toggle-sub-menu {
  fill: var(--primary-color);
}
.no-svg .toggle-sub-menu.active:before {
  border-color: var(--secondary-color) transparent transparent transparent;
}
.no-svg .toggle-sub-menu.highlighted {
  border-color: var(--secondary-color) transparent transparent transparent;
}
.svg .toggle-sub-menu.highlighted {
  fill: var(--secondary-color);
}

.menu-main a {
  font-style: var(--menu-main-font-style);
  font-weight: var(--menu-main-font-weight);
  text-decoration: var(--menu-main-text-decoration);
  text-transform: var(--menu-main-text-transform);
}
.menu-main a:hover {
  font-style: var(--menu-main-hover-font-style);
  font-weight: var(--menu-main-hover-font-weight);
  text-decoration: var(--menu-main-hover-text-decoration);
  text-transform: var(--menu-main-hover-text-transform);
}
.menu-main .selected a,
.menu-main .current a {
  font-style: var(--menu-main-active-font-style);
  font-weight: var(--menu-main-active-font-weight);
  text-decoration: var(--menu-main-active-text-decoration);
  text-transform: var(--menu-main-active-text-transform);
}

@media screen and (max-width: 1024px) {
  .mobile-menu-toggler span, .mobile-menu-toggler span:before, .mobile-menu-toggler span:after {
    background-color: var(--secondary-color);
  }
  .dark-background .mobile-menu-toggler span, .dark-background .mobile-menu-toggler span:before, .dark-background .mobile-menu-toggler span:after {
    background-color: var(--third-color);
  }
  .mobile-menu-toggler span.flags-disabled .lang-menu-btn .lang-title, .mobile-menu-toggler span:before.flags-disabled .lang-menu-btn .lang-title, .mobile-menu-toggler span:after.flags-disabled .lang-menu-btn .lang-title {
    color: var(--third-color);
  }

  #mobile-menu .search-open-btn svg {
    fill: var(--secondary-color);
  }
  #mobile-menu ul a {
    color: var(--primary-color);
  }
  #mobile-menu .navigation-menu > ul > li > a {
    font-style: var(--menu-main-font-style);
    font-weight: var(--menu-main-font-weight);
    text-decoration: var(--menu-main-text-decoration);
    text-transform: var(--menu-main-text-transform);
  }
  #mobile-menu .navigation-menu > ul > li > a:hover {
    font-style: var(--menu-main-hover-font-style);
    font-weight: var(--menu-main-hover-font-weight);
    text-decoration: var(--menu-main-hover-text-decoration);
    text-transform: var(--menu-main-hover-text-transform);
  }
  #mobile-menu .navigation-menu > ul > li > a.selected, #mobile-menu .navigation-menu > ul > li > a.current {
    font-style: var(--menu-main-active-font-style);
    font-weight: var(--menu-main-active-font-weight);
    text-decoration: var(--menu-main-active-text-decoration);
    text-transform: var(--menu-main-active-text-transform);
  }
  #mobile-menu .navigation-menu ul a.selected {
    color: var(--secondary-color);
  }
  #mobile-menu .navigation-menu .sub-menu a {
    font-style: var(--menu-sub-font-style);
    font-weight: var(--menu-sub-font-weight);
    text-decoration: var(--menu-sub-text-decoration);
    text-transform: var(--menu-sub-text-transform);
  }
  #mobile-menu .navigation-menu .sub-menu a:hover {
    font-style: var(--menu-sub-hover-font-style);
    font-weight: var(--menu-sub-hover-font-weight);
    text-decoration: var(--menu-sub-hover-text-decoration);
    text-transform: var(--menu-sub-hover-text-transform);
  }
  #mobile-menu .navigation-menu .sub-menu a.selected, #mobile-menu .navigation-menu .sub-menu a.current {
    font-style: var(--menu-sub-active-font-style);
    font-weight: var(--menu-sub-active-font-weight);
    text-decoration: var(--menu-sub-active-text-decoration);
    text-transform: var(--menu-sub-active-text-transform);
  }
  #mobile-menu .lang-menu ul li a.is-active {
    color: var(--secondary-color);
  }
}
.lang-flag:before {
  background-color: var(--secondary-color);
}

/* langmenu */
.lang-menu.lang-menu-bilingual .lang-title a.is-active {
  color: var(--secondary-color);
}
.lang-menu li a {
  color: var(--primary-color);
}
.dark-background .lang-menu a.lang-flag, .light-background .lang-menu a.lang-flag {
  color: var(--secondary-color);
}
.dark-background .lang-menu a.lang-flag:hover, .light-background .lang-menu a.lang-flag:hover {
  color: var(--secondary-color);
}

.lang-menu-btn .lang-title-inner:after {
  border-color: var(--secondary-color) transparent transparent transparent;
}
.dark-background .lang-menu-btn .lang-title-inner:after {
  border-color: var(--third-color) transparent transparent transparent;
}

.site-sidebar .sidebar-title a {
  color: var(--secondary-color);
}
.dark-background .site-sidebar .sidebar-title a {
  color: var(--third-color);
}
.site-sidebar .submenu a {
  font-weight: var(--menu-sub-font-weight);
  font-style: var(--menu-sub-font-style);
  text-decoration: var(--menu-sub-text-decoration);
  text-transform: var(--menu-sub-text-transform);
  color: var(--secondary-color);
}
.site-sidebar .submenu a:hover {
  font-weight: var(--menu-sub-hover-font-weight);
  font-style: var(--menu-sub-hover-font-style);
  text-decoration: var(--menu-sub-hover-text-decoration);
  text-transform: var(--menu-sub-hover-text-transform);
}
.dark-background .site-sidebar .submenu a {
  color: var(--third-color);
}
.site-sidebar .submenu .selected,
.site-sidebar .submenu .selected a,
.site-sidebar .submenu .current,
.site-sidebar .submenu .current a {
  font-weight: var(--menu-sub-active-font-weight);
  font-style: var(--menu-sub-active-font-style);
  text-decoration: var(--menu-sub-active-text-decoration);
  text-transform: var(--menu-sub-active-text-transform);
}
.site-sidebar .submenu .selected {
  color: var(--secondary-color);
}
.dark-background .site-sidebar .submenu .selected {
  color: var(--third-color);
}
.site-sidebar .submenu .submenu-lvl2 a {
  color: var(--secondary-color);
}
.dark-background .site-sidebar .submenu .submenu-lvl2 a {
  color: var(--third-color);
}
.dark-background .site-sidebar .submenu .submenu-lvl2 .selected {
  color: var(--third-color);
}

.site-footer .dark-background .content-area a {
  color: var(--third-color);
}
.site-footer .voog-reference {
  color: var(--secondary-color);
}
.site-footer .blog-article-nav .article-nav-direction {
  color: var(--secondary-color);
}
.site-footer .blog-article-nav .article-nav-title {
  color: var(--secondary-color);
}
.site-footer .blog-article-nav.dark-background .article-nav-title {
  color: var(--third-color);
}
.site-footer .blog-article-nav.dark-background .article-nav-direction {
  color: var(--third-color);
}

.content-area {
  font-size: var(--content-body-font-size);
  line-height: var(--content-body-line-height);
  color: var(--primary-color);
  text-align: var(--content-body-alignment);
}
.dark-background .content-area {
  color: var(--third-color);
}
.site-footer .dark-background .content-area {
  color: var(--third-color);
}
.site-footer .content-area {
  font-size: var(--footer-body-font-size);
  font-style: var(--footer-body-font-style);
  font-weight: var(--footer-body-font-weight);
  color: var(--primary-color);
  text-align: var(--footer-body-alignment);
  text-decoration: var(--footer-body-text-decoration);
  text-transform: var(--footer-body-text-transform);
}
.content-area.header-title {
  font-size: var(--header-body-font-size);
  font-style: var(--header-body-font-style);
  font-weight: var(--header-body-font-weight);
  text-decoration: var(--header-body-text-decoration);
  text-transform: var(--header-body-text-transform);
}
.dark-background .content-area h1, .dark-background
.content-area h2, .dark-background
.content-area h3, .dark-background
.content-area h4, .dark-background
.content-area h5, .dark-background
.content-area h6, .dark-background
.content-area p, .dark-background
.content-area ul, .dark-background
.content-area ol, .dark-background
.content-area pre, .dark-background
.content-area code, .dark-background
.content-area table {
  color: var(--third-color);
}
.content-area h1,
.content-area h2,
.content-area h3,
.content-area h4,
.content-area h5,
.content-area h6 {
  color: var(--secondary-color);
}
.content-area h1 a,
.content-area h2 a,
.content-area h3 a,
.content-area h4 a,
.content-area h5 a,
.content-area h6 a {
  color: var(--secondary-color);
}
.content-area p,
.content-area ul,
.content-area ol,
.content-area dl {
  font-size: var(--content-body-font-size);
}
.site-footer .content-area p, .site-footer
.content-area ul, .site-footer
.content-area ol, .site-footer
.content-area dl {
  color: var(--primary-color);
}
.site-footer .dark-background .content-area p, .site-footer .dark-background
.content-area ul, .site-footer .dark-background
.content-area ol, .site-footer .dark-background
.content-area dl {
  color: var(--third-color);
}
.content-area h1,
.content-area h1 a,
.content-area h1 a:hover {
  text-align: var(--headings-title-text-alignment);
  line-height: var(--headings-title-line-height);
  font-size: var(--headings-title-font-size);
  font-weight: var(--headings-title-font-weight);
  font-style: var(--headings-title-font-style);
  text-decoration: var(--headings-title-text-decoration);
  text-transform: var(--headings-title-text-transform);
}
.content-area h2,
.content-area h2 a,
.content-area h2 a:hover {
  text-align: var(--headings-heading-text-alignment);
  line-height: var(--headings-heading-line-height);
  font-size: var(--headings-heading-font-size);
  font-weight: var(--headings-heading-font-weight);
  font-style: var(--headings-heading-font-style);
  text-decoration: var(--headings-heading-text-decoration);
  text-transform: var(--headings-heading-text-transform);
}
.content-area h3,
.content-area h3 a,
.content-area h3 a:hover,
.content-area h4,
.content-area h4 a,
.content-area h4 a:hover,
.content-area h5,
.content-area h5 a,
.content-area h5 a:hover,
.content-area h6,
.content-area h6 a,
.content-area h6 a:hover {
  text-align: var(--headings-subheading-text-alignment);
  line-height: var(--headings-subheading-line-height);
  font-size: var(--headings-subheading-font-size);
  font-weight: var(--headings-subheading-font-weight);
  font-style: var(--headings-subheading-font-style);
  text-decoration: var(--headings-subheading-text-decoration);
  text-transform: var(--headings-subheading-text-transform);
}
.content-area a {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--secondary-color);
  text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}
.content-area a:hover {
  font-style: var(--content-link-hover-font-style);
  font-weight: var(--content-link-hover-font-weight);
  text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
}
.dark-background .content-area a {
  color: var(--third-color);
}
.content-area a.custom-btn {
  padding: calc(var(--button-padding) - 18px) var(--button-padding) calc(var(--button-padding) - 17px);
  font-size: var(--button-font-size);
  font-style: var(--button-font-style);
  font-weight: var(--button-font-weight);
  text-decoration: var(--button-text-decoration);
  text-transform: var(--button-text-transform);
}
.dark-background .content-area a.custom-btn:hover {
  border-color: var(--third-color);
  background-color: var(--third-color);
  color: var(--primary-color);
}
.dark-background .content-area a.custom-btn {
  border-color: var(--third-color);
  color: var(--third-color);
}
.content-area table th,
.content-area table td {
  padding: calc(var(--table-padding) - 4px) var(--table-padding);
  font-size: var(--table-font-size);
  border-style: var(--table-border-style);
}
.dark-background .content-area table th, .dark-background
.content-area table td {
  border-color: var(--third-color);
}
.content-area table th {
  color: var(--third-color);
  background-color: var(--secondary-color);
}
.contacts .content-area table tr td {
  color: var(--primary-color);
}

.content-area .form_field_textfield,
.content-area .form_field_textarea {
  font-style: var(--form-field-font-style);
  font-weight: var(--form-field-font-weight);
  font-size: var(--form-field-font-size);
  text-decoration: var(--form-field-text-decoration);
  text-transform: var(--form-field-text-transform);
}
.dark-background .content-area .form_field_textfield,
.dark-background .content-area .form_field_textarea,
.dark-background .content-area .form_field_select {
  color: var(--third-color);
}
.dark-background .content-area .form_field_textfield::-webkit-input-placeholder,
.dark-background .content-area .form_field_textarea::-webkit-input-placeholder,
.dark-background .content-area .form_field_select::-webkit-input-placeholder {
  color: var(--third-color);
}
.dark-background .content-area .form_field_textfield::-moz-placeholder,
.dark-background .content-area .form_field_textarea::-moz-placeholder,
.dark-background .content-area .form_field_select::-moz-placeholder {
  color: var(--third-color);
}
.dark-background .content-area .form_field_textfield:-moz-placeholder,
.dark-background .content-area .form_field_textarea:-moz-placeholder,
.dark-background .content-area .form_field_select:-moz-placeholder {
  color: var(--third-color);
}
.dark-background .content-area .form_field_textfield:-ms-input-placeholder,
.dark-background .content-area .form_field_textarea:-ms-input-placeholder,
.dark-background .content-area .form_field_select:-ms-input-placeholder {
  color: var(--third-color);
}
.light-background .content-area .form_field_textfield,
.light-background .content-area .form_field_textarea,
.light-background .content-area .form_field_select {
  color: var(--primary-color);
}
.light-background .content-area .form_field_textfield::-webkit-input-placeholder,
.light-background .content-area .form_field_textarea::-webkit-input-placeholder,
.light-background .content-area .form_field_select::-webkit-input-placeholder {
  color: var(--primary-color);
}
.light-background .content-area .form_field_textfield::-moz-placeholder,
.light-background .content-area .form_field_textarea::-moz-placeholder,
.light-background .content-area .form_field_select::-moz-placeholder {
  color: var(--primary-color);
}
.light-background .content-area .form_field_textfield:-moz-placeholder,
.light-background .content-area .form_field_textarea:-moz-placeholder,
.light-background .content-area .form_field_select:-moz-placeholder {
  color: var(--primary-color);
}
.light-background .content-area .form_field_textfield:-ms-input-placeholder,
.light-background .content-area .form_field_textarea:-ms-input-placeholder,
.light-background .content-area .form_field_select:-ms-input-placeholder {
  color: var(--primary-color);
}
.content-area .form_submit input {
  padding: calc(var(--button-padding) - 18px) var(--button-padding) calc(var(--button-padding) - 17px);
  font-size: var(--button-font-size);
  font-style: var(--button-font-style);
  font-weight: var(--button-font-weight);
  text-decoration: var(--button-text-decoration);
  text-transform: var(--button-text-transform);
}
.dark-background .content-area .form_submit input {
  color: var(--secondary-color);
  background-color: var(--third-color);
}
.light-background .content-area .form_submit input {
  color: var(--third-color);
  background-color: var(--secondary-color);
}
