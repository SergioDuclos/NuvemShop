{% for category in categories %}
    {% if category.subcategories %}
        <li class="mobile-nav_category-list-item mobile-nav_category-list-item-w-subitems mobile-subitems-container">
            <span data-target="js-category-{{ category.id }}" class="mobile-nav_category-list-item-link js-open-mobile-subcategory">
                {{ category.name }}
                <i class="fa fa-chevron-right mobile-right-panel_arrow-right"></i>
            </span>
        </li>
    {% else %}
        <li class="mobile-nav_category-list-item">
            <a class="mobile-nav_category-list-item-link" href="{{ category.url }}">
                {{ category.name }}
            </a>
        </li>
    {% endif %}
{% endfor %}