<div class="mobile-nav_tabs-container visible-phone">
    <a href="{{ store.url }}" class="mobile-nav_tab {% if store.is_catalog %}mobile-nav_tab-half{% endif %} {% if template == 'home' %} mobile-nav_tab-selected mobile-nav_tab-current-page{% endif %} pull-left">
        <span class="mobile-nav_tab-text">{{ 'Inicio' | translate }}</span>
    </a>
    <a {% if categories %}href="#"{% else %}href="{{ store.products_url }}"{% endif %} id="mobile-categories-btn" class="mobile-nav_tab {% if categories %}js-toggle-mobile-categories{% endif %} {% if store.is_catalog %}mobile-nav_tab-half{% endif %} {% if template == 'category' or template == 'product' %} mobile-nav_tab-selected mobile-nav_tab-current-page{% endif %} pull-left">
        <span class="mobile-nav_tab-text">{{ 'Productos' | translate }}</span>
    </a>
    {% if not store.is_catalog %}
        {% if settings.ajax_cart %}
            <a href="#" class="mobile-nav_tab js-toggleCart js-toggleCart-ajax p-relative {% if template == 'cart' %} mobile-nav_tab-selected mobile-nav_tab-current-page{% endif %} pull-left">
                <div class="mobile-tav_cart-text-container d-inline-block">
                    <span class="mobile-nav_tab-text">{{ 'Carrito' | translate }}</span>
                    {% if template != 'cart' %}
                        <span id="mobile-cart-amount" class="mobile-nav_tab-cart-amount">{{ "{1}" | translate(cart.items_count ) }}</span>
                    {% endif %}
                </div>
            </a>
        {% else %}
            <div class="mobile-nav_tab {% if template == 'cart' %} mobile-nav_tab-selected mobile-nav_tab-current-page{% endif %} pull-left">
            {% if cart.items_count > 0 %}
            <a href="{{ store.cart_url }}">
            {% else %}
            <a href="#" class="js-trigger-empty-cart-alert">
            {% endif %}
                <div class="mobile-tav_cart-text-container d-inline-block">
                    <span class="mobile-nav_tab-text">{{ 'Carrito' | translate }}</span>
                    {% if template != 'cart' %}
                       <span id="mobile-cart-amount" class="mobile-nav_tab-cart-amount">{{ "{1}" | translate(cart.items_count ) }}</span>
                    {% endif %}
                </div>
            </a>
            </div>
            <div class="js-mobile-nav-empty-cart-alert alert alert-info mobile-nav_empty-cart-alert">{{ "El carrito de compras está vacío." | translate }}</div>
        {% endif %}
    {% endif %}
</div>