{% if site.search.enabled %}
  <div class="search js-search">
    <div class="search-middle">
      <div class="search-inner js-search-inner">
        <form id="search" class="search-form js-search-form" method="get" action="#">
          <input id="onpage_search" class="search-input js-search-input" type="text" placeholder="{{ 'search_this_site' | lc }}">
        </form>

        <button class="search-btn search-close-btn js-search-reset-btn">
          <svg width="16px" height="16px" viewbox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
            <path d="M15.205,2.743 C15.205,2.743 10.03,7.918 10.03,7.918 C10.03,7.918 15.109,12.997 15.109,12.997 C15.695,13.583 15.694,14.533 15.109,15.118 C14.523,15.704 13.574,15.704 12.988,15.118 C12.988,15.118 7.909,10.039 7.909,10.039 C7.909,10.039 2.743,15.205 2.743,15.205 C2.149,15.799 1.187,15.799 0.594,15.205 C0,14.612 0,13.65 0.594,13.056 C0.594,13.056 5.759,7.89 5.759,7.89 C5.759,7.89 0.674,2.805 0.674,2.805 C0.088,2.218 0.088,1.269 0.674,0.683 C1.259,0.098 2.209,0.097 2.795,0.683 C2.795,0.683 7.881,5.769 7.881,5.769 C7.881,5.769 13.055,0.594 13.055,0.594 C13.649,0 14.611,0.001 15.205,0.594 C15.798,1.188 15.799,2.149 15.205,2.743 Z "></path>
          </svg>
        </button>

        <div class="voog-search-modal js-voog-search-modal"></div>
      </div>
    </div>
  </div>
{% endif %}
