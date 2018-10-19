<div class="js-mobile-nav js-search-container mobile-nav row-fluid">
    <div class="js-mobile-first-row mobile-nav_first-row">      
        <div class="menu-btn mobile-nav_hamburger-btn text-center visible-phone pull-left">
            <div class="mobile-nav-first-row_svg-icon">
                <svg class="svg-hamburguer-icon" baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="598 -476.1 1792 1792"><path d="M2262 867.9v128c0 17.3-6.3 32.3-19 45s-27.7 19-45 19H790c-17.3 0-32.3-6.3-45-19s-19-27.7-19-45v-128c0-17.3 6.3-32.3 19-45s27.7-19 45-19h1408c17.3 0 32.3 6.3 45 19s19 27.7 19 45zm0-512v128c0 17.3-6.3 32.3-19 45s-27.7 19-45 19H790c-17.3 0-32.3-6.3-45-19s-19-27.7-19-45v-128c0-17.3 6.3-32.3 19-45s27.7-19 45-19h1408c17.3 0 32.3 6.3 45 19s19 27.7 19 45zm0-512v128c0 17.3-6.3 32.3-19 45s-27.7 19-45 19H790c-17.3 0-32.3-6.3-45-19s-19-27.7-19-45v-128c0-17.3 6.3-32.3 19-45s27.7-19 45-19h1408c17.3 0 32.3 6.3 45 19s19 27.7 19 45z"/></svg>
            </div>
        </div>
        <div class="mobile-nav_page-title">
            {% snipplet "mobile-page-title.tpl" %}
        </div>
        <div class="js-toggle-mobile-search js-toggle-mobile-search-open mobile-nav_search-btn mobile-search-btn visible-phone text-center pull-right">
            <div class="mobile-nav-first-row_svg-icon pull-right">
                <svg class="svg-search-icon" baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="598 -476.1 1792 1792"><path d="M1814 355.9c0-123.3-43.8-228.8-131.5-316.5-87.7-87.7-193.2-131.5-316.5-131.5s-228.8 43.8-316.5 131.5C961.8 127.1 918 232.6 918 355.9s43.8 228.8 131.5 316.5c87.7 87.7 193.2 131.5 316.5 131.5s228.8-43.8 316.5-131.5c87.7-87.7 131.5-193.2 131.5-316.5zm512 832c0 34.7-12.7 64.7-38 90s-55.3 38-90 38c-36 0-66-12.7-90-38l-343-342c-119.3 82.7-252.3 124-399 124-95.3 0-186.5-18.5-273.5-55.5s-162-87-225-150-113-138-150-225S662 451.2 662 355.9s18.5-186.5 55.5-273.5 87-162 150-225 138-113 225-150 178.2-55.5 273.5-55.5 186.5 18.5 273.5 55.5 162 87 225 150 113 138 150 225 55.5 178.2 55.5 273.5c0 146.7-41.3 279.7-124 399l343 343c24.7 24.7 37 54.7 37 90z"/></svg>
            </div>
        </div>
    </div>
    <div class="js-mobile-search-row mobile-nav_search-row row-fluid">
        <form action="{{ store.search_url }}" method="get" class="js-search-form mobile-nav_search-form mobile-search-form">
            <div class="input-prepend mobile-search-input-container">
                <span class="add-on js-search-back-btn js-toggle-mobile-search mobile-nav_search-back-btn">
                    <i class="fa fa-chevron-left mobile-nav_search-icon" aria-hidden="true"></i>
                </span>
                <input class="js-mobile-nav-search-input js-search-input mobile-nav_search-input text-input span2 m-half-left" autocomplete="off" type="search" name="q" placeholder="{{ 'buscar' | translate }}"/>
                <button type="submit" class="add-on mobile-nav_search-submit" value="">
                     <i class="fa fa-search mobile-nav_search-icon"></i>
                </button>
            </div>
        </form>
    </div>
    <div class="js-mobile-nav-second-row mobile-nav_second-row container-fluid">
        {% snipplet "navigation/navigation-mobile-tabs.tpl" %}
    </div>
</div>
<div class="js-search-suggest search-suggest">
    {# AJAX container for search suggestions #}
</div>
{# Categories list for mobile #}
<div class="js-categories-mobile-container" style="display:none;">
    <ul class="mobile-nav_main-categories-container mobile-categories-nav">
        <li> 
            <a href="#" class="js-toggle-mobile-categories mobile-nav_main-categories-close-btn mobile-categories-nav-close pull-right"><i class="fa fa-times mobile-nav_main-categories-close-btn-icon"></i></a>
        </li>
        <li>
            <a class="text-wrap border-top border-bottom mobile-nav_all-categories-link"  href="{{ store.products_url }}">
                {{ 'Ver todos los productos' | translate }}
            </a>
        </li>
        {% snipplet "navigation/navigation-mobile-categories.tpl" %}
    </ul>
    {% for category in categories %}
        {% snipplet "navigation/navigation-mobile-categories-panels.tpl" %}
    {% endfor %}
</div>