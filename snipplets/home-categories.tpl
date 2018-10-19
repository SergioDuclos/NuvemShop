<div class="horizontal-container mobile-horizontal-categories m-top visible-phone">
    <ul class="mobile-horizontal-categories_list list-style-none">
        {% for category in categories %}
            <li data-item="{{ loop.index }}" class="mobile-horizontal-categories_list-item d-inline-block">
            	<a class="mobile-horizontal-categories_link text-uppercase" href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a>
            </li>
        {% endfor %}
    </ul>
</div>
