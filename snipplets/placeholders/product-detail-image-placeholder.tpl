{# Mobile product detail placeholder: to be hidden after content loaded #}
<div class="js-product-slider-placeholder mobile-placeholder product-slider_placeholder-container {% if product.images_count == 1 %}hidden-when-content-ready{% endif %} p-relative overflow-none">
    <div class="product-slider-placeholder_figures-container full-width border-box">
    	<div class="product-slider-placeholder_svg-icon">
	    	<svg baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="-158 281.9 279 279"><path d="M78.5 347.8l-40.3.1v-9.5c0-31.2-25-56.5-56.2-56.5h-1c-31.2 0-56.8 25.3-56.8 56.5v9.5l-39.6-.1-30 210.7 252.5.4-28.6-211.1zm-139.3-9.4c0-22.9 19-41.5 41.8-41.5h1c22.9 0 41.2 18.6 41.2 41.5v9.5h-84v-9.5z"/></svg>
	    </div>
    </div>
    <div class="shine p-absolute full-width full-height">
    </div>
    <div class="js-product-detail-loading-icon p-absolute product-detail_loading-icon-container full-width {% if product.images_count == 1 %}hidden-when-content-ready{% endif %}">
        <div class="product-detail_loading-icon svg_loading-icon opacity-80 rotate">
            <svg baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="598 -476.1 1792 1792"><path d="M2237 579.9c0 3.3-.3 5.7-1 7-42.7 178.7-132 323.5-268 434.5s-295.3 166.5-478 166.5c-97.3 0-191.5-18.3-282.5-55s-172.2-89-243.5-157l-129 129c-12.7 12.7-27.7 19-45 19s-32.3-6.3-45-19-19-27.7-19-45v-448c0-17.3 6.3-32.3 19-45s27.7-19 45-19h448c17.3 0 32.3 6.3 45 19s19 27.7 19 45-6.3 32.3-19 45l-137 137c47.3 44 101 78 161 102s122.3 36 187 36c89.3 0 172.7-21.7 250-65s139.3-103 186-179c7.3-11.3 25-50.3 53-117 5.3-15.3 15.3-23 30-23h192c8.7 0 16.2 3.2 22.5 9.5s9.5 13.8 9.5 22.5zm25-800v448c0 17.3-6.3 32.3-19 45s-27.7 19-45 19h-448c-17.3 0-32.3-6.3-45-19s-19-27.7-19-45 6.3-32.3 19-45l138-138c-98.7-91.3-215-137-349-137-89.3 0-172.7 21.7-250 65s-139.3 103-186 179c-7.3 11.3-25 50.3-53 117-5.3 15.3-15.3 23-30 23H776c-8.7 0-16.2-3.2-22.5-9.5s-9.5-13.8-9.5-22.5v-7c43.3-178.7 133.3-323.5 270-434.5s296.7-166.5 480-166.5c97.3 0 192 18.5 284 55.5s173.7 89.2 245 156.5l130-129c12.7-12.7 27.7-19 45-19s32.3 6.3 45 19c12.7 12.7 19 27.7 19 45z"/></svg>
        </div>
    </div>
</div>