{# Products that work as examples #}
<div class="banner">
    {{ "images/banner-category.svg" | static_url | img_tag }}
</div>
<div class="row-fluid">
    <div class="row-fluid" id="products-example">
        <div class="productContainer">
            <div class="dest-list">
                <div class="headerBox">
                    <h2>{{"Productos de ejemplo" | translate}}</h2>
                </div>
                <div class="product-row visible-when-content-ready">  
                    <!-- Product 01 -->
                    <div class="span3 product-item-container">
                        <div class="dest-gral">
                            <div class="head">
                                <div class="product-grid-labels">
                                    <div class="offer-product offer-product-bottom">
                                        33% OFF
                                    </div>
                                </div>
                                <a href="/product/example" title="{{ product.name }}" class="product-image">
                                    {{ "images/help-product-2.svg" | static_url | img_tag }}
                                </a>
                            </div>
                            <div class="bajada">
                                <div class="title">
                                    <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                </div>
                                <div class="price m-none-xs">
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="p-left-none-xs p-quarter-right-xs">{{"150000" | money }}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="1000">{{"100000" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product 02 -->
                    <div class="span3 product-item-container">
                        <div class="dest-gral">
                            <div class="head">
                                <div class="product-grid-labels">
                                    <div class="free-shipping-product shipping-product-bottom">{{ "Envío sin cargo" | translate }}</div>
                                </div>
                                <a href="/product/example" title="{{ product.name }}" class="product-image">
                                    {{ "images/help-product-1.svg" | static_url | img_tag }}
                                </a>
                            </div> 
                            <div class="bajada">
                                <div class="title">
                                    <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                </div>
                                <div class="price m-none-xs">
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="p-left-none-xs p-quarter-right-xs">{{"450000" | money }}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="1000">{{"100000" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product 03 -->
                    <div class="span3 product-item-container">
                        <div class="dest-gral">
                            <div class="head"> 
                                <a href="/product/example" title="{{ product.name }}" class="product-image">
                                    {{ "images/help-product-6.svg" | static_url | img_tag }}
                                </a>
                            </div> 
                            <div class="bajada">
                                <div class="title">
                                    <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                </div>
                                <div class="price m-none-xs">
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="p-left-none-xs p-quarter-right-xs">{{"132000" | money}}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="1020">{{"102000" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product 04 -->
                    <div class="span3 product-item-container">
                        <div class="dest-gral">
                            <div class="head"> 
                                <div class="product-grid-labels">
                                    <div class="out-of-stock-product">{{ "Sin stock" | translate }}</div>
                                </div>
                                <a href="/product/example" title="{{ product.name }}" class="product-image">
                                    {{ "images/help-product-3.svg" | static_url | img_tag }}
                                </a>
                            </div> 
                            <div class="bajada">
                                <div class="title">
                                    <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                </div>
                                <div class="price m-none-xs">
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="p-left-none-xs p-quarter-right-xs">{{"38000" | money}}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="320">{{"32000" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-row">  
                    <!-- Product 05 -->
                    <div class="span3 product-item-container">
                        <div class="dest-gral">
                            <div class="head"> 
                                <a href="/product/example" title="{{ product.name }}" class="product-image">
                                    {{ "images/help-product-4.svg" | static_url | img_tag }}
                                </a>
                            </div> 
                            <div class="bajada">
                                <div class="title">
                                    <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                </div>
                                <div class="price m-none-xs">
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="p-left-none-xs p-quarter-right-xs">{{"142000" | money}}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="1220">{{"122000" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product 07 -->
                    <div class="span3 product-item-container">
                        <div class="dest-gral">
                            <div class="head"> 
                                <a href="/product/example" title="{{ product.name }}" class="product-image">
                                    {{ "images/help-product-9.svg" | static_url | img_tag }}
                                </a>
                            </div> 
                            <div class="bajada">
                                <div class="title">
                                    <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                </div>
                                <div class="price m-none-xs">
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="p-left-none-xs p-quarter-right-xs">{{"142000" | money}}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="1220">{{"122000" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product 08 -->
                    <div class="span3 product-item-container">
                        <div class="dest-gral">
                            <div class="head"> 
                                <a href="/product/example" title="{{ product.name }}" class="product-image">
                                    {{ "images/help-product-8.svg" | static_url | img_tag }}
                                </a>
                            </div> 
                            <div class="bajada">
                                <div class="title">
                                    <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                </div>
                                <div class="price m-none-xs">
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="p-left-none-xs p-quarter-right-xs">{{"142000" | money}}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="1220">{{"122000" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product 09 -->
                    <div class="span3 product-item-container">
                        <div class="dest-gral">
                            <div class="head"> 
                                <div class="product-grid-labels">
                                    <div class="free-shipping-product {% if product.available %}shipping-product-bottom{% endif %}">{{ "Envío sin cargo" | translate }}</div>
                                </div>
                                <a href="/product/example" title="{{ product.name }}" class="product-image">
                                    {{ "images/help-product-5.svg" | static_url | img_tag }}
                                </a>
                            </div> 
                            <div class="bajada">
                                <div class="title">
                                    <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                </div>
                                <div class="price m-none-xs">
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="p-left-none-xs p-quarter-right-xs">{{"142000" | money}}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="1220">{{"122000" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end scroller-->
        </div>
    </div>
</div>