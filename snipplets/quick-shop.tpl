{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}
<div style="display: none;">
    <div id="quick{{ product.id }}" class="quick-content">
        <div class="productContainer js-product-container" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
            <div class="row-fluid">
                <div class="span6">
                    <div class="imagecol">
                        <div class="span11">
                            <div class="imagecolContent">
                                {{ product.featured_variant_image | product_image_url('huge') | img_tag(product.featured_image.alt) }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="descriptioncol">
                        <div class="descriptioncolContent">
                            <div class="row-fluid m-half-bottom">
                                <div class="span10">
                                    <div class="title">
                                        <h2 itemprop="name">{{ product.name }}</h2>
                                    </div>
                                    <div class="span12">
                                         {% if product.free_shipping %}
                                        <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
                                        {% endif %}
                                        <div class="offer-product js-offer-label" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                                            <span>
                                                <span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>% OFF
                                            </span>
                                        </div>
                                        <div class="out-of-stock-product js-stock-label" {% if product.has_stock %}style="display:none;"{% endif %}>{{ "Sin stock" | translate }}</div>
                                    </div>
                                </div>
                                <div class="span10 m-none">
                                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                        <div class="price">
                                            <span class="price js-price-display" id="price_display" itemprop="price"{% if product.display_price %} content="{{ product.price / 100 }}"{% endif %} {% if not product.display_price %}style="display:none;"{% endif %}>{% if product.display_price %}{{ product.price | money }}{% endif %}</span>
                                            <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                                            {% if product.stock_control %}
                                                <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                                <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                                            {% endif %}
                                            <span class="price-compare">
                                            <span id="compare_price_display" class="js-compare-price-display" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                {% if product.display_price %}
                                <div class="m-half-top pull-left ful-width">
                                    {% snipplet "installments_in_product.tpl" %}
                                </div>
                                {% endif %}
                                <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
                                <meta itemprop="url" content="{{ product.social_url }}" />
                                {% if page_description %}
                                    <meta itemprop="description" content="{{ page_description }}" />
                                {% endif %}
                            </div>
                            <div class="line"></div>
                            <form id="product_form" class="js-product-form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                {% if product.variations  %}
                                    {% include "snipplets/variants.tpl" with {'quickshop': true} %}
                                {% endif %}
                                {% set stepslength = product.variations | length  %}
                                {% if product.available and product.display_price %}
                                    <div class="attributeLine-quickshop product-quantity m-half-bottom">
                                        <label class="variation-label product-quantity_label">
                                        <div class="number">{{ stepslength + 1 }}</div>
                                        <span>{{ "Elegir" | translate }} </span>
                                        <strong>{{ "Cantidad" | translate }}</strong></label>
                                        <input class="spinner product-quantity_quickshop-input product-quantity_input" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                                    </div>
                                {% endif %} 
                                <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <input type="submit" class="button js-prod-submit-form addToCart js-addtocart {{state}}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                                </div>
                            </form>
                            <div class="description visible-when-content-ready user-content">
                                {% if product.description != '' %}
                                <h5>{{ "Descripción" | translate }}</h5>
                                    {{ product.description | plain | truncateWords(30) }} ...
                                    <a class="quick" href="{{ product.url }}" title="{{ product.name }}">{{ "Ver <strong>{1}</strong> en detalle" | translate(product.name) }}</a>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>