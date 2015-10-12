{% if site.search.enabled %}
  <div class="search js-search js-prevent-sideclick">
    <div class="search-middle">
      <div class="search-inner js-search-inner">
        <form id="search" class="search-form js-search-form" method="get" action="#">
          <input id="onpage_search" class="search-input js-search-input" type="text" placeholder="{{ "search_this_site" | lc }}">
        </form>

        <button class="search-btn search-close-btn js-search-reset-btn">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10" width="10px" height="10px">
            <path fill="rgba(0,0,0,.71)" d="M10,1.1L6.1,5L10,8.9L8.9,10L5,6.1L1.1,10L0,8.9L3.9,5L0,1.1L1.1,0L5,3.9L8.9,0L10,1.1z"></path>
          </svg>
        </button>

        <div class="voog-search-modal js-voog-search-modal"></div>
      </div>
    </div>
  </div>
{% endif %}
