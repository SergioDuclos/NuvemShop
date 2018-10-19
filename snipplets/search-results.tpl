<ul class="search-suggest_list">
    {% for product in products %}
        <li class="search-suggest_item">
            <a href="{{ product.url }}" class="search-suggest_link">
                <div class="search-suggest_image-container hidden-phone">
                    {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest_image'}) }}
                </div>
                <div class="search-suggest_text">
                	<p class="search-suggest_product-name">
                		{{ product.name | highlight(query) }}
                	</p>
                    {% if product.display_price %}
                    	<p class="search-suggest_price hidden-phone">
                    		{{ product.price | money }}
                    	</p>
                        {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
                        {% if product_can_show_installments %}
                            <span class="search-suggest_installments hidden-phone">
                                {% set max_installments_without_interests = product.get_max_installments(false) %}
                                {% if store.installments_on_steroids_enabled and store.country == 'AR' %}
                                    {% set max_installments_with_interests = product.get_max_installments %}
                                    {% if max_installments_with_interests %}
                                        <div class="max_installments m-quarter-top-xs">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                    {% endif %}
                                {% else %}
                                    {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                        <div class="max_installments m-none">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                                    {% else %}
                                        {% set max_installments_with_interests = product.get_max_installments %}
                                        {% if max_installments_with_interests %}
                                            <div class="max_installments m-none">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                        {% endif %}
                                    {% endif %}
                                {% endif %}
                            </span>
                        {% endif %}
                    {% endif %}
                </div>
                <i class="search-suggest_icon fa fa-chevron-right hidden-phone"></i>
            </a>
        </li>
    {% endfor %}
    <li class="search-suggest_item hidden-phone">
        <a href="#" class="js-search-suggest_all-results-link search-suggest_link search-suggest_all-results-link">{{ 'Ver todos los resultados' | translate }}</a>
    </li>
</ul>