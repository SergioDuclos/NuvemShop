<ul id="js-category-{{ category.id }}" class="mobile-nav_subcategories-panel mobile-nav_subcategories-panel mobile-right-panel" style="display:none;">
    <a class="js-go-back-mobile-categories mobile-right-panel_header" href="#">
        <i class="fa fa-arrow-left mobile-right-panel_arrow-left"></i>
        <span class="mobile-right-panel_header-text">{{ category.name }}</span>
    </a>
    <li class="mobile-nav_category-list-item">
        <a class="mobile-nav_all-categories-link" href="{{ category.url }}">
        {{ "Ver toda esta categoría" | translate }}
        </a>
    </li>
    {% snipplet "navigation/navigation-mobile-categories.tpl" with categories = category.subcategories %}
</ul>
{% for subcategory in category.subcategories %}
    {% snipplet "navigation/navigation-mobile-categories-panels.tpl" with category = subcategory %}
{% endfor %}