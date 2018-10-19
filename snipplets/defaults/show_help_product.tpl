{# Single product that works as an example #}
<div class="container">    
    <div id="single-product">
        <div id="single-product-container" class="productContainer row-fluid producto visible-when-content-ready" >

            <div class="span6">
                <div class="imagecol">

                    <div class="mobile-bxslider">            
                        <ul class="bxslider" id="productbxslider"> 
                            <li class="product-slider">
                            <a href="{{ "images/help-product-2.svg" | static_url }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: 'Cargando...'" >
                                {{ "images/help-product-2.svg" | static_url | img_tag }}
                            </a></li> 
                        </ul> 
                    </div>

                    <div class="desktop-featured-product">
                        <div class="span3"> 
                            <div id="tS3" class="jThumbnailScroller">
                                <div class="jTscrollerContainer">
                                    <div class="jTscroller"> 
                                        <a id="red" href="{{ "images/help-product-44.svg" | static_url }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-44.svg" | static_url }}' ">
                                {{ "images/help-product-44.svg" | static_url | img_tag }}
                            </a>
                            <a id="green" href="{{ "images/help-product-45.svg" | static_url }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-45.svg" | static_url }}' ">
                                {{ "images/help-product-45.svg" | static_url | img_tag }}
                            </a>
                            <a id="blue" href="{{ "images/help-product-2.svg" | static_url }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-2.svg" | static_url }}' ">
                                {{ "images/help-product-2.svg" | static_url | img_tag }}
                            </a>
                                    </div>
                                </div>
                                <a href="#" class="jTscrollerPrevButton"></a>
                                <a href="#" class="jTscrollerNextButton"></a>
                            </div> 
                        </div>
                        <div class="span9">
                            <div class="imagecolContent">
                                <a href="{{ "images/help-product-2.svg" | static_url }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: 'Cargando...'" >
                                {{ "images/help-product-2.svg" | static_url | img_tag }}
                            </a>
                            </div>
                        </div>
                    </div>  

                </div>
                <!-- SHARE BUTTONS -->
                <div class="container-box">
                    <div class="shareLinks">
                        <div class="shareItem twitter product-share-button" data-network="twitter">
                            {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                        </div>
                        <div class="shareItem whatsapp product-share-button p-relative visible-phone">
                           <a target="_blank"
                             href="whatsapp://send?text={{ product.social_url }}">
                              <i class="fa fa-whatsapp p-absolute"></i>
                              {{ "Compartir" | translate }}
                          </a>
                        </div>
                        <div class="shareItem google product-share-button" data-network="gplus">
                            {{product.social_url | g_plus('medium') }}
                        </div>
                        <div class="shareItem facebook product-share-button" data-network="facebook">
                            {{product.social_url | fb_like('store-product', 'button_count')}}
                        </div>
                        <div class="shareItem pinterest product-share-button" data-network="pinterest">
                            {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
                        </div>
                    </div>
                </div>
            </div>

            <div class="span6">
                <div class="descriptioncol">
                    <div class="descriptioncolContent">

                        <div class="row-fluid">
                            <div class="span8">
                                <div class="title">
                                    <h1 itemprop="name">{{ "Producto de ejemplo" | translate }}</h1>
                                </div> 
                                <div class="offer-product">33% OFF</div>
                            </div>  
                            <div class="span4 price-holder">
                                <div itemprop="offers">
                                    <div class="price">
                                        <span class="price-compare">
                                          <span id="compare_price_display">{{"150000" | money }}</span>
                                        </span>
                                        <span class="price" id="price_display">{{"100000" | money }}</span> 
                                    </div>
                                </div>
                            </div>
                            <div class="installments">
                                <h5>{{ "En hasta 12 cuotas con tarjeta de crédito" | translate }}</h5>
                            </div>
                        </div>
                            <form id="product_form" method="post" action="">
                                <input type="hidden" name="add_to_cart" value="2243561">
                                <div class="fancyContainer">
                                    <div class="span12"> 
                                        <div class="span4">
                                            <div class="attributeLine">
                                                <label class="variation-label" for="variation_1">{{ "Talle" | translate }}</label>
                                                <select id="variation_1" name="variation[0]">
                                                    <option value="s" selected="selected">{{ "S" | translate }}</option>
                                                    <option value="m">{{ "M" | translate }}</option>
                                                    <option value="l">{{ "L" | translate }}</option>
                                                    <option value="xl">{{ "XL" | translate }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="span4">
                                            <div class="attributeLine">
                                                <label class="variation-label" for="color_variant">{{ "Color" | translate }}</label>
                                                <select id="color_variant" name="color_variant">
                                                    <option value="blue" selected="selected">{{ "Azul" | translate }}</option>
                                                    <option value="green">{{ "Verde" | translate }}</option>
                                                    <option value="red">{{ "Rojo" | translate }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="span4">
                                            <div class="attributeLine">
                                                <label class="variation-label" for="variation_3">{{ "Material" | translate }}</label>
                                                <select id="variation_3" name="variation[2]">
                                                    <option value="Resorte" selected="selected">{{ "Denim" | translate }}</option>
                                                    <option value="Ganchito">{{ "Algodón" | translate }}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                               <div class="row-fluid product-quantity clear">
                                    <div class="quantity attributeLine span6 pull-left">
                                        <label class="variation-label product-quantity_label">
                                        <span>{{ "Elegir" | translate }} </span>
                                        <strong>{{ "Cantidad" | translate }}</strong></label>
                                        <input class="spinner product-quantity_input" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                                    </div>
                                </div>
                                
                                <div class="addToCartButton m-half-top m-top-xs">
                                    <input type="submit" href="#" class="button addToCart js-addtocart cart" value="{{ "Agregar al carrito" | translate }}" disabled>
                                </div>
                                {% if store.country == 'BR' %}
                                    <div id="shipping-calculator" class="shipping-calculator text-left">
                                        <div class="row-fluid">
                                            <div id="shipping-calculator-form-example" class="shipping-calculator-form">
                                                <span class="shipping-calculator_label text-left-xs m-half-right">{{ "Calculá el costo de tu envío" | translate }}:</span>
                                                <input type="text" name="zipcode" value="{{ cart.shipping_zipcode }}" placeholder="{{ 'Código postal' | translate }}" class="shipping-zipcode">
                                                <button class="button calculate-shipping-button secondary-button">{{ "Calcular costo de envío" | translate }}</button>
                                                <span class="loading" style="display: none;"><i class="fa fa-circle-o-notch fa-spin"></i></span>
                                                <span class='alert alert-error invalid-zipcode' style="display: none;">{{ "El código postal es inválido." | translate }}</span>
                                            </div>
                                        </div>
                                        {# response #}
                                        <div id="shipping-calculator-response-example" class="shipping-calculator-response" style="display: none;">
                                            <span>{{ "Este es un ejemplo de opciones de envío para un código postal" | translate }}</span>
                                            <ul class="shipping-list">
                                                <li>
                                                    <label for="shipping-1">
                                                        <span><img src="https://d26lpennugtm8s.cloudfront.net/assets/common/img/logos/shipping/br/correios/pac@2x.png">Correios - PAC - 6 dias úteis - R$19,10</span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label for="shipping-2">
                                                        <span><img src="https://d26lpennugtm8s.cloudfront.net/assets/common/img/logos/shipping/br/correios/sedex@2x.png">Correios - SEDEX - 1 dia útil - R$43,00</span>
                                                    </label>
                                                </li>
                                            </ul>
                                            <input type="hidden" name="after_calculation" value="1">
                                            <input type="hidden" name="zipcode" value="32682558">
                                        </div> 
                                    </div>
                                {% endif %}
                            </form>
                        <div class="description visible-when-content-ready user-content" itemscope="" itemtype="http://schema.org/Product">
                            <p>{{ "¡Este es un producto de ejemplo! Para poder probar el proceso de compra, debes" | translate }}
                                <a href="/admin/products" target="_top">{{ "agregar tus propios productos." | translate }}</a>
                            </p>
                        </div>
                        <div class="fb-comments" data-href="/" data-num-posts="5" data-width="100%"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</div> 
</div>
{% if show_help %}
    <script type="text/javascript">
        $(document).ready(function(){
            var $shipping_calculator = $("#shipping-calculator");
            var $invalid_zipcode = $("#invalid-zipcode");
            var $shipping_calculator_loading = $shipping_calculator.find(".loading")
            $("#calculate-shipping-button-example").click(function() {
                $invalid_zipcode.hide(1);
                $shipping_calculator_loading.show( 1 ).delay( 1800 ).hide(1);
                event.preventDefault(); // cancel default behavior
                if( $("#shipping-zipcode").val().length === 8 || $("#shipping-zipcode").val().length === 9 ) {
                    $("#shipping-calculator-form-example, #shipping-calculator-response-example").toggle();
                } else {
                    $("#invalid-zipcode").delay( 1800 ).show(1);
                }
            }); 

            $('#color_variant').change(function(){
                var $values_color = $( "select#color_variant option:selected" ).val();
                $('#' + $values_color).click();
                if ( $values_color == 'green'){
                    $(".price02").show();
                    $(".price01").hide();
                } else {
                    $(".price02").hide();
                    $(".price01").show();
                }
            }); 
        }); 
    </script>
{% endif %}