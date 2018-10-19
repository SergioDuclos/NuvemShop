<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
	
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
	<title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    {% if settings.fb_admins %}
        <meta property="fb:admins" content="{{ settings.fb_admins }}" />
    {% endif %}
    {% if store_fb_app_id %}
        <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
    {% elseif not store.has_custom_domain %}
        <meta property="fb:app_id" content="{{ fb_app.id }}" />
    {% endif %}
    {{ store.name | og('site_name') }}
    {% if template == 'home' and store.logo %}
        {{ ('http:' ~ store.logo) | og('image') }}
        {{ ('https:' ~ store.logo) | og('image:secure_url') }}
    {% endif %}
    
    {# OG tags to control how the page appears when shared on Facebook. See http://ogp.me/ #}
    {% snipplet "metas/facebook-og.tpl" %}
    {# Twitter tags to control how the page appears when shared on Twitter. See https://dev.twitter.com/cards/markup #}
    {% if template == 'product' %}
        {# Twitter #}
        {% snipplet "metas/twitter-product.tpl" %}
        {# Facebook #}
        {% snipplet "metas/facebook-product-og.tpl" %}
    {% elseif template == 'category' %}
        {# Facebook #}
        {% snipplet "metas/facebook-category-og.tpl" %}
    {% endif %}
    
    <!-- Critical CSS to improve the percieved performance on first load -->
    <style>
        {% snipplet 'css/critical-css.tpl' %}
    </style>

    {{ '//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700|Open+Sans:400,300,700|Slabo+27px|Oswald:400,300,700|Lora:400,700|Roboto+Condensed:400italic,700italic,300,400,700|Droid+Sans:400,700' | css_tag }}
    
    <!-- Aynsc CSS for the non-critical stylesheets -->
    {% snipplet 'js/load-css-async.tpl' %}
	{{ 'custom.scss.tpl' | static_url | css_tag }}

    {% set nojquery = true %}
    {% set async_js = true %}
    {% head_content %}

	<!--[if lte IE 7]>
		{{ "ie.css" | static_url | css_tag }}
	<![endif]-->
    <!--[if lt IE 9]>
        {{ "html5shiv-printshiv.js" | static_url | script_tag }}
    <![endif]-->

    <style>
        {{ settings.css_code | raw }}
    </style>
</head>
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
{{ social_js }}
{% if template == 'account.login' or template == 'account.register' %}
<script>
    function loginFacebook() {
        LS.ready.then(function(){
            LS.facebookLogin(FB, function(status, hasEmail) {
                if (status === 'connected') {
                    if (hasEmail) {
                        window.location = "{{ store.url }}/account/facebook_login/";
                    } else {
                        $('#login-form').prepend(
                                "<div class=\"st error c\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                    }
                } else {
                    $('#login-form').prepend(
                            "<div class=\"st error c\">{{ 'Debes completar el login.' | translate }}</div>");
                }
            });
        });
    }
</script>
{% endif %}
{{back_to_admin}}

<!-- Pushy Menu -->
<nav class="pushy pushy-left mobile-sidenav">
    {% snipplet "navigation/navigation-hamburguer-panel.tpl" %}
</nav>
<!-- Site Overlay -->
<div class="site-overlay"></div>
<div class="backdrop mobile-search-backdrop js-search-backdrop js-toggle-mobile-search container-fluid" style="display: none;"></div>
<div id="container">
    <div class="container visible-phone">
        {% snipplet "navigation/navigation-mobile.tpl" %}
    </div>
    <div class="main-content">
        <div class="container">
            <header>
                <div class="row-fluid">
                    <div class="span3 search-wr hidden-phone">
                        <div class="searchbox">
                            <form class="js-search-container js-search-form" action="{{ store.search_url }}" method="get">
                                <input class="text-input js-search-input" autocomplete="off" type="search" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                                <input class="submit-button" type="submit" value=""/>
                            </form>
                            <div class="js-search-suggest search-suggest">
                                {# AJAX container for search suggestions #}
                            </div>
                        </div>
                    </div>
                    <div class="span6 logo-wr logo-container">
                        {% if template == 'home' %}
                            {% if has_logo %}
                                <h1 class="img logo mobile-logo-home">
                                    {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                                </h1>
                                <div id="no-logo-wrapper" class="hidden">
                                    <div id="logo" class="logo-text">
                                        <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
                                    </div>
                                </div>
                            {% else %}
                                <div class="img logo hidden mobile-logo-home">
                                    {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                                </div>
                                <h1 id="no-logo-wrapper">
                                    <div id="logo" class="logo-text">
                                        <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
                                    </div>
                                </h1>
                            {% endif %}
                        {% else %}
                                <div class="img logo{% if not has_logo %} hidden{% endif %}">
                                    {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                                </div>
                                <div id="no-logo-wrapper" {% if has_logo %}class="hidden"{% endif %}>
                                    <div id="logo" class="logo-text">
                                        <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
                                    </div>
                                </div>
                        {% endif %}
                    </div>
                    <div class="span3 hidden-phone">
                        {% if languages | length > 1 %}
                            <div class="languages cart-desktop">
                                {% for language in languages %}
                                    {% set class = language.active ? "active" : "" %}
                                    <a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
                                {% endfor %}
                            </div>
                        {% endif %}
                        {% if not store.is_catalog and template != 'cart' %}
                            {% if settings.ajax_cart %}
                                {% snipplet "cart-widget-ajax.tpl" as "cart" %}
                            {% else %}
                                {% snipplet "cart.tpl" as "cart" %}
                            {% endif %}
                        {% endif %}
                        {% if store.has_accounts %}
                            <div id="auth" class="cart-desktop">
                                {% if not customer %}
                                    {% if 'mandatory' not in store.customer_accounts %}
                                    {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
                                    {% endif %}
                                    {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                                {% else %}
                                    {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
                                    {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                                {% endif %}
                            </div>
                        {% endif %}
                    </div>
                </div>
                <div id="navigation">
                    <ul id="menu" class="sf-menu">
                        {% snipplet "navigation/navigation.tpl" %}
                    </ul>
                </div>
            </header>
        </div>
        <div class="container">
            {% template_content %}
        </div>
        {% if settings.banner_services %}
        <div class="container">
            <div class="banner-services-footer m-half-bottom-xs m-half-top-xs">
                 {% include 'snipplets/banner-services/banner-services.tpl' %}
             </div>
         </div>    
        {% endif %}
     
        <div id="wrapper-foot" class="visible-when-content-ready">
            <div class="container"> 
                {% set has_shipping_logos = settings.shipping %}
                {% set has_payment_logos = settings.payments %}
                {% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
                {% set has_footer_contact_info = store.phone or store.email or store.blog or store.address %}
                {% if not (has_footer_contact_info or has_shipping_payment_logos or has_products) %}
                    {# This is a snipplet to show the user the payment and send methods the first time they visit the store #}
                   {% snipplet "defaults/show_help_footer.tpl" %}
                {% else %}
                <div class="row-fluid">
                    <div class="span{{ has_shipping_payment_logos ? 2 : 3 }} responsive-inline">
                        <div class="col-foot">
                            <h4>{{ "Navegación" | translate }}</h4>
                            {% snipplet "navigation/navigation-foot.tpl" %}
                        </div>
                    </div>
                    <div class="span{{ has_shipping_payment_logos ? 2 : 3 }} responsive-inline">
                        <div class="col-foot">
                            <h4>{{ "Redes Sociales" | translate }}</h4>
                            {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                                {% set sn_url = attribute(store,sn) %}
                                {% if sn_url %}
                                    <a href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i></a>
                                {% endif %}
                            {% endfor %}
                        </div>
                         <div class="col-foot">
                            <h4>{{ settings.news_message }}</h4>
                            {% snipplet "newsletter.tpl" %}
                        </div>
                    </div>
                    {% if has_shipping_payment_logos %}
                        <div class="span3">
                            {% if has_payment_logos %}
                                <div class="col-foot">
                                    <h4>{{ "Medios de pago" | translate }}</h4>
                                    {% for payment in settings.payments %}
                                        {{ payment | payment_logo | img_tag('', {'height' : 20}) }}
                                    {% endfor %}
                                </div>
                            {% endif %}
                            {% if has_shipping_logos %}
                                <div class="col-foot">
                                    <h4>{{ "Formas de envío" | translate }}</h4>
                                    {% for shipping in settings.shipping %}
                                        {{ shipping | shipping_logo | img_tag('', {'height' : 20}) }}
                                    {% endfor %}
                                </div>
                            {% endif %}
                        </div>
                    {% endif %}
                    <div class="{% if not (store.afip or ebit or settings.custom_seal_code or "seal_img.jpg" | has_custom_image ) %}span5{% else %}span3{% endif %}">
                        <div class="col-foot contact-data text-center-xs">
                            <h4>{{ "Contactanos" | translate }}</h4>
                            {% if store.phone %}
                                <li><i class="fa fa-phone"></i><a href="tel:{{ store.phone }}" class="text-decoration-none">{{ store.phone }}</a></li>
                            {% endif %}
                            {% if store.email %}
                                <li><i class="fa fa-envelope"></i>{{ store.email | mailto }}</li>
                            {% endif %}
                            {% if store.blog %}
                                <li><i class="fa fa-comments"></i><a target="_blank" href="{{ store.blog }}">{{ "Visita nuestro Blog!" | translate }}</a></li>
                            {% endif %}
                            {% if store.address %}
                                <li><i class="fa fa-map-marker"></i>{{ store.address }}</li>
                            {% endif %}
                        </div>
                    </div>
                    {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                        <div class="span2 seals">
                            <div class="col-foot">
                                <h4>{{ "Seguridad y Certificaciones" | translate }}</h4>
                                {% if store.afip %}
                                    <div class="afip">
                                        {{ store.afip | raw }}
                                    </div>
                                {% endif %}
                                {% if ebit %}
                                    <div class="ebit">
                                        {{ ebit }}
                                    </div>
                                {% endif %}
                                
                                {% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
                                <div class="custom-seals-container">
                                    {% if "seal_img.jpg" | has_custom_image %}
                                        <div class="custom-seal custom-seal-img">
                                            {% if settings.seal_url != '' %}
                                            <a href="{{ settings.seal_url }}" target="_blank">
                                                {{ "seal_img.jpg" | static_url | img_tag }}
                                            </a>
                                            {% else %}
                                                {{ "seal_img.jpg" | static_url | img_tag }}
                                            {% endif %}
                                        </div>
                                    {% endif %}
                                    {% if settings.custom_seal_code %}
                                        <div class="custom-seal custom-seal-code">
                                            {{ settings.custom_seal_code | raw }}
                                        </div>
                                    {% endif %}
                                </div>
                                {% endif %}
                            </div>
                        </div>
                    {% endif %}
                </div>  
                {% endif %}       
            </div>
        </div> 

        <div id="wrapper-legal" class="visible-when-content-ready">
            <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <div class="powered-by">
                            {#
                            La leyenda que aparece debajo de esta linea de código debe mantenerse
                            con las mismas palabras y con su apropiado link a Tienda Nube;
                            como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                            Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                            tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
                            Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
                            palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                            http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                            e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                            manter visivél e com um link funcionando.
                            #}
                            {{ new_powered_by_link }}
                        </div>
                    </div>
                    <div class="span6">
                        <div class="copyright">
                            {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {# AJAX Cart Panel #}
    {% if not store.is_catalog and template != 'cart' and settings.ajax_cart %}
        {% snipplet "cart-panel-ajax.tpl" %}
    {% endif %}
</div>
<!-- External JS: Plugins and libraries -->
<script>
    LS.ready.then(function(){
        {% snipplet "js/external.js.tpl"  %}
    });
</script>

<!-- Store JS -->
<script type="text/javascript">
    LS.ready.then(function() {
        /* Newsletter Avoid Siteblindado bot spam */
        LS.newsletter_avoid_siteblindado_bot();
        var $newspopup_mandatory_field = $('#newsletter-popup').find(".mandatory-field");

        {% if settings.show_news_box %}
        $('#newsletter-popup').submit(function () {
            $(".loading-modal").show();
            $newspopup_mandatory_field.removeClass("input-error");
            $("#newsletter-popup .btn").prop("disabled", true);
            ga_send_event('contact', 'newsletter', 'popup');
        });
        LS.newsletter('#newsletter-popup', '#newsModal', '{{ store.contact_url | escape('js') }}', function (response) {
            $(".loading-modal").hide();
            var selector_to_use = response.success ? '.contact-ok' : '.contact-error';
            $(this).find(selector_to_use).fadeIn(100).delay(1300).fadeOut(500);
            if ($("#newsletter-popup .contact-ok").css("display") == "block") {
                setTimeout(function () {
                    $("#newsModal").modal('hide');
                }, 2500);
            } else {
                $newspopup_mandatory_field.addClass("input-error");
            }
            $('#newsletter-popup input[type="text"]').val('');
            $("#newsletter-popup .btn").prop("disabled", false);
        });
        $(document).ready(function () {
            LS.newsletterPopup();
        });
        {% endif %}
    });

    function get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests) {
        if (parseInt(number_of_installment) > parseInt(max_installments_without_interests[0])) {
            if (installment_data.without_interests) {
                return [number_of_installment, installment_data.installment_value.toFixed(2)];
            }
        }
        return max_installments_without_interests;
    }

    function get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests) {
        if (parseInt(number_of_installment) > parseInt(max_installments_with_interests[0])) {
            if (installment_data.without_interests == false) {
                return [number_of_installment, installment_data.installment_value.toFixed(2)];
            }
        }
        return max_installments_with_interests;
    }

	function changeVariant(variant){
        $("#single-product .shipping-calculator-response").hide();
        $("#shipping-variant-id").val(variant.id);
        var parent = $("body");
        if (variant.element){
            parent = $(variant.element);
        }

        var sku = parent.find('#sku');
        if(sku.length) {
            sku.text(variant.sku).show();
        }

        var installment_helper = function($element, amount, price){
            $element.find('.installment-amount').text(amount);
            $element.find('.installment-price').attr("data-value", price);
            $element.find('.installment-price').text(LS.currency.display_short + parseFloat(price).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
            if(variant.price_short && Math.abs(variant.price_number - price * amount) < 1) {
                $element.find('.installment-total-price').text((variant.price_short).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
            } else {
                $element.find('.installment-total-price').text(LS.currency.display_short + (price * amount).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
            }
        };

        if (variant.installments_data) {
            var variant_installments = JSON.parse(variant.installments_data);
            var max_installments_without_interests = [0,0];
            var max_installments_with_interests = [0,0];
            $.each(variant_installments, function(payment_method, installments) {
                $.each(installments, function(number_of_installment, installment_data) {
                    max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
                    max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
                    var installment_container_selector = '#installment_' + payment_method + '_' + number_of_installment;
                    installment_helper($(installment_container_selector), number_of_installment, installment_data.installment_value.toFixed(2));
                });
            });
            var $installments_container = $(variant.element + ' .installments.max_installments_container .max_installments');
            var $installments_modal_link = $(variant.element + ' #button-installments');
            var $payments_module = $(variant.element + ' .js-mobile-toggle-installments');
            var $installmens_card_icon = $(variant.element + ' .js-installments-credit-card-icon');

            {% if store.installments_on_steroids_enabled and product.has_direct_payment_only %}
            var installments_to_use = max_installments_without_interests[0] >= 1 ? max_installments_without_interests : max_installments_with_interests;

            if(installments_to_use[0] <= 0 ) {
            {%  else %}
            var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;

            if(installments_to_use[0] <= 1 ) {
            {% endif %}
                $installments_container.hide();
                $installments_modal_link.hide();
                $payments_module.hide();
                $installmens_card_icon.hide();
            } else {
                $installments_container.show();
                $installments_modal_link.show();
                $payments_module.show();
                $installmens_card_icon.show();
                installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
            }
        }

        $('.js-installments-one-payment').text(variant.price_short);
        $('.js-installments-one-payment').attr("data-value", variant.price_number);

        if (variant.price_short){
            parent.find('.js-price-display').text(variant.price_short).show();
            parent.find('.js-price-display').attr("content", variant.price_number);
        } else {
            parent.find('.js-price-display').hide();
        }

        if ((variant.compare_at_price_short) && !($(".js-price-display").css("display") == "none")) {
            parent.find('.js-compare-price-display').text(variant.compare_at_price_short).show();
        } else {
            parent.find('.js-compare-price-display').hide();
        }

        if(variant.contact) {
            parent.find('.container-box').hide();
        } else {
            parent.find('.container-box').show();
        }

		var button = parent.find('.addToCart');
		button.removeClass('cart').removeClass('contact').removeClass('nostock');
        {% if not store.is_catalog %}
		if (!variant.available){
			button.val('{{ "Sin stock" | translate }}');
			button.addClass('nostock');
			button.attr('disabled', 'disabled');
            $("#single-product .shipping-calculator-form").hide();
		} else if (variant.contact) {
			button.val('{{ "Consultar precio" | translate }}');
			button.addClass('contact');
			button.removeAttr('disabled');
            $("#single-product .shipping-calculator-form").hide();
		} else {
			button.val('{{ "Agregar al carrito" | translate }}');
			button.addClass('cart');
			button.removeAttr('disabled');
            $("#single-product .shipping-calculator-form").show();
		}
        {% endif %}
	}

	LS.ready.then(function() {
        $(document).ready(function () {

            // Cart page and panel handlers
            // Key pressed in quantity input
            $(document).on("keypress", ".ajax-cart-item_qty-input, .col-quantity input", function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            // Quantity input focus out
            $(document).on("focusout", ".ajax-cart-item_qty-input, .col-quantity input", function (e) {
                $(".shipping-calculator-response").hide().empty();
                $("#go-to-checkout").prop("disabled", true);
                var itemID = $(this).attr("data-item-id");
                var itemVAL = $(this).val();
                if (itemVAL == 0) {
                    var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
                    if (r == true) {
                        LS.removeItem(itemID, true);
                    } else {
                        $(this).val(1);
                    }
                } else {
                    LS.changeQuantity(itemID, itemVAL, true);
                }
            });

            {% if settings.ajax_cart %}
            $(document).on("click", ".js-addtocart", function (e) {
                if (!$(this).hasClass('contact')) {
                    e.preventDefault();
                    $prod_form = $(this).closest("form");
                    LS.addToCart(
                        $prod_form,
                        '{{ "Agregar al carrito" | translate }}',
                        '{{ "Agregando..." | translate }}',
                        '{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}',
                            {{ store.editable_ajax_cart_enabled ? 'true' : 'false' }}
                    );
                }
            });

            $(document).on("click", ".js-toggleCart", function (e) {
                e.preventDefault();
                LS.toggleCart();
            });
            $('input.shipping-method:checked').livequery(function () {
                var shippingPrice = $(this).attr("data-price");
                LS.addToTotal(shippingPrice);
            });
            $(document).on("click", "input.shipping-method", function () {
                var elem = $(this);
                var shippingPrice = elem.attr("data-price");
                elem.click(function () {
                    LS.addToTotal(shippingPrice);
                });
            });

            //Mobile cart update
            $('.js-toggleCart').click(function () {
                var ajax_cart_value = $('#cart-amount').text();
                $("#mobile-cart-amount").html(ajax_cart_value);
            });

            {% endif %}

            // Mobile navigation main element
            var $top_nav = $(".js-mobile-nav");
            var $page_main_content = $(".main-content");
            var $mobile_categories_btn = $(".js-toggle-mobile-categories");
            var $main_categories_mobile_container = $(".js-categories-mobile-container");
            var $search_backdrop = $(".js-search-backdrop");

            // Mobile search
            $(".js-toggle-mobile-search").click(function (e) {
                e.preventDefault;
                var $mobile_tab_navigation = $(".js-mobile-nav-second-row");
                $(".js-mobile-first-row").toggle();
                $(".js-mobile-search-row").toggle();
                $mobile_tab_navigation.toggle();
                $(".js-search-input").val();
                $search_backdrop.toggle().toggleClass("search-open");
                if (!$("body").hasClass("mobile-categories-visible")) {
                    $("body").toggleClass("overflow-none");
                } else {
                    $("body").removeClass("mobile-categories-visible");
                }
                $main_categories_mobile_container.hide();
                if ($page_main_content.hasClass("move-up")) {
                    $page_main_content.removeClass("move-up").addClass("move-down");
                    $search_backdrop.removeClass("move-up").addClass("move-down");
                    setTimeout(function () {
                        $page_main_content.removeClass("move-down");
                    }, 200);
                } else {
                    $page_main_content.removeClass("move-down").addClass("move-up");
                    $search_backdrop.removeClass("move-down").addClass("move-up");
                }
                if ($mobile_categories_btn.hasClass("mobile-nav_tab-selected")) {
                    $mobile_categories_btn.removeClass("mobile-nav_tab-selected");
                    $(".mobile-nav_tab-current-page").addClass("mobile-nav_tab-selected");
                }
            });

            var $mobile_search_input = $(".js-mobile-nav-search-input");
            $(".js-toggle-mobile-search-open").click(function (e) {
                e.preventDefault;
                $mobile_search_input.focus();
            });
            $(".js-search-back-btn").click(function (e) {
                $(".js-search-suggest").hide();
                $mobile_search_input.val('');
            });

            // Mobile categories
            $top_nav.addClass("move-down").removeClass("move-up");
            $mobile_categories_btn.click(function (e) {
                e.preventDefault();
                $("body").toggleClass("overflow-none mobile-categories-visible");
                if ($mobile_categories_btn.hasClass("mobile-nav_tab-selected")) {
                    $mobile_categories_btn.removeClass("mobile-nav_tab-selected");
                    $(".mobile-nav_tab-current-page").addClass("mobile-nav_tab-selected");
                } else {
                    $mobile_categories_btn.addClass("mobile-nav_tab-selected");
                    $(".mobile-nav_tab-current-page").removeClass("mobile-nav_tab-selected");
                }
                $main_categories_mobile_container.toggle();
                if ($top_nav.hasClass("move-up")) {
                    $main_categories_mobile_container.toggleClass("move-list-up");
                }
            });

            // Mobile subcategories navigation
            $(".js-open-mobile-subcategory").click(function (e) {
                e.preventDefault();
                var $this = $(this);
                var this_link_id_val = $this.data("target");
                var $subcategories_panel_to_be_visible = $this.closest($main_categories_mobile_container).find("#" + this_link_id_val);
                $subcategories_panel_to_be_visible.detach().insertAfter(".js-categories-mobile-container > ul:last-child");
                $subcategories_panel_to_be_visible.addClass("animation-panel-right-close").show();
                setTimeout(function () {
                    $subcategories_panel_to_be_visible.toggleClass("animation-panel-right-open animation-panel-right-close");
                }, 100);
            });

            $(".js-go-back-mobile-categories").click(function (e) {
                e.preventDefault();
                var $this = $(this);
                var $subcategories_panel_to_be_closed = $this.closest(".mobile-nav_subcategories-panel");
                $(".mobile-nav_subcategories-panel").scrollTop(0);
                $subcategories_panel_to_be_closed.toggleClass("animation-panel-right-open animation-panel-right-close");
                setTimeout(function () {
                    $subcategories_panel_to_be_closed.removeClass("animation-panel-right-close").hide();
                }, 300);
            });

            //Pages inside hamburguer sidenav navigation
            $(".js-toggle-page-accordion").click(function (e) {
                e.preventDefault();
                $(this).toggleClass("mobile-sidenav_pages-arrow-selected").closest(".js-mobile-sidenav-pages-link-container").next(".pages-accordion").slideToggle(300);
            });

            // Empty cart alert (only if AJAX cart widget is not active)
            $(".js-trigger-empty-cart-alert").click(function (e) {
                e.preventDefault();
                $(".js-mobile-nav-empty-cart-alert").fadeIn(100).delay(1500).fadeOut(500);
            });
            // Show and hide part of nav depending scroll up or down
            var didScroll;
            var lastScrollTop = 0;
            var delta = 20;
            var navbarHeight = $('header').outerHeight();

            $(window).scroll(function (event) {
                didScroll = true;
            });

            setInterval(function () {
                if (didScroll) {
                    hasScrolled();
                    didScroll = false;
                }
            }, 250);

            function hasScrolled() {
                var st = $(this).scrollTop();

                // Make sure they scroll more than delta
                if (Math.abs(lastScrollTop - st) <= delta)
                    return;

                // If they scrolled down and are past the navbar, add class .move-up.
                if (st > lastScrollTop && st > navbarHeight) {
                    // Scroll Down
                    if (!$("body").hasClass("mobile-categories-visible")) {
                        $top_nav.addClass("move-up").removeClass("move-down");
                    }
                    $(".backdrop").addClass("move-up").removeClass("move-down");
                } else {
                    // Scroll Up
                    if (st + $(window).height() < $(document).height()) {
                        if (!$("body").hasClass("mobile-categories-visible")) {
                            $top_nav.removeClass("move-up").addClass("move-down");
                        }
                        $(".backdrop").removeClass("move-up").addClass("move-down");
                    }
                }

                lastScrollTop = st;
            }

            // Search suggestions

            LS.search($(".js-search-input"), function (html, count) {
                $search_suggests = $(this).closest(".js-search-container").next(".js-search-suggest");
                if (count > 0) {
                    $search_suggests.html(html).show();
                } else {
                    $search_suggests.hide();
                }
                if ($(this).val().length == 0) {
                    $search_suggests.hide();
                }
            }, {
                snipplet: 'search-results.tpl'
            });
            if ($(window).width() > 768) {
                $("body").click(function () {
                    $(".js-search-suggest").hide();
                })
            }

            $(".js-search-suggest").on("click", ".js-search-suggest_all-results-link", function (e) {
                e.preventDefault();
                $this_closest_form = $(this).closest(".js-search-suggest").prev(".js-search-form");
                $this_closest_form.submit();
            });

            LS.registerOnChangeVariant(function (variant) {
                // this is used on quick shop modals
                var current_image = $('img', '#quick' + variant.product_id);
                current_image.attr('src', variant.image_url);
                // this is used on single product view
                $(".cloud-zoom-gallery[data-image=" + variant.image + "] > img").click();
            });

            $('#menu').supersubs({
                minWidth: 8,
                maxWidth: 40,
                extraWidth: 1.3
            }).superfish({
                autoArrows: false,
                dropShadows: false,
                speed: 'fast',
                delay: 500
            });

            $('#menu a').bind('touchstart', function (e) {
                var li = $(this).parent('li');
                if (li.find('ul a').length > 0) {
                    e.preventDefault();

                    if (!li.hasClass('sfHover')) {
                        li.showSuperfishUl().siblings().hideSuperfishUl();
                    } else {
                        li.hideSuperfishUl();
                    }

                    return false;
                }
            });

            $('#menu a[href=#]').click(function (e) {
                e.preventDefault();
                return false;
            });

            window.homeSlider = {
                getSliderConfiguration: function() {
                    return {
                        //JS For home slider Preloader - hides the images until loaded
                        onSliderLoad: function(){
                            $("#slider").css("visibility", "visible");
                            $(".bx-wrapper img").css("visibility", "visible");
                            $(".js-home-slider-preloader, .js-home-slider-placeholder, .slider_placeholder, .js-home-slider-desktop-placeholder").hide();
                            $(".js-home-slider").css({"visibility" : "visible" , "height" : "auto"});
                            $(".js-home-slider-container .bx-controls-direction, .js-home-slider-container .bx-pager").show();
                          },
                        pause: 5000,
                        autoHover: true,
                        adaptiveHeight: false
                    };
                },
                getAutoRotation: function () {
                    return {% if settings.slider_auto %}true{% else %}false{% endif %};
                },
                create: function () {
                    var config = this.getSliderConfiguration();
                    config.auto = this.getAutoRotation() && this.get$Element().children().size() > 1;
                    this._instance = this.get$Element().bxSlider(config);
                    return this;
                },
                getInstance: function () {
                    return this._instance;
                },
                get$Element: function () {
                    return $('.homeslider');
                },
                get$Wrapper: function () {
                    return $('.slider-wrapper');
                }
            };
            window.homeSlider.create();

            //Banner services mobile slider
            var $banner_services_slider = $('.banner-services-slider');
            var has_more_than_one_banner_service = $banner_services_slider.find('.banner-service-item').length / $banner_services_slider.length > 1;
            $banner_services_slider.bxSlider({
                // When only one element, don't spin. It's 3 because there is always two more elements to achieve the sliding effect.
                auto: false,
                touchEnabled: has_more_than_one_banner_service,
                controls: false,
                adaptiveHeight: false,
                onSliderLoad: function () {
                    $banner_services_slider.css("visibility", "visible");
                    $(".mobile-banner-services .bx-has-pager").css("visibility", "visible");
                    $(".js-services-banners-placeholder").hide();
                    $(".js-mobile-services-banner").addClass("p-half-top-xs").css({"visibility" : "visible", "height" : "auto"});
                }
            });

            if (!has_more_than_one_banner_service) {
                $(".mobile-banner-services .bx-has-pager").hide();
            }

            {% if settings.slider | length == 1 %}
            $('.homeslider .bx-pager').remove();
            {% endif %}

            $('.fancybox').fancybox();

            {% if contact and contact.success %}
            {% if contact.type == 'newsletter' %}
            $('#newsletter form').hide();
            $('#newsletter .title').hide();
            $('#newsletter #ofertas').hide();
            ga_send_event('contact', 'newsletter', 'standard');
            {% elseif contact.type == 'contact' %}
            ga_send_event('contact', 'contact-form');
            {% endif %}
            {% endif %}

            // Detect no price on product and redirects to contact form
            $(".js-product-form").submit(function (e) {
                var button = $(this).find(':submit');
                button.attr('disabled', 'disabled');
                if ((button.hasClass('contact')) || (button.hasClass('catalog'))) {
                    e.preventDefault();
                    var product_id = $(this).find("input[name='add_to_cart']").val();
                    window.location = "{{ store.contact_url | escape('js') }}?product=" + product_id;
                } else if (button.hasClass('cart')) {
                    button.val('{{ "Agregando..." | translate }}');
                }
            });

            // Show and hide labels and installments on variant change or page load

            $(document).on("change", ".js-variation-option", function(e) {
                var $this_compare_price =  $(this).closest(".js-product-container").find(".js-compare-price-display");
                var $this_price = $(this).closest(".js-product-container").find(".js-price-display");
                var $installment_container = $(this).closest(".js-product-container").find(".js-mobile-toggle-installments");
                var $installment_text = $(this).closest(".js-product-container").find(".js-max-installments-container");
                var $this_product_container = $(this).closest(".js-product-container");
                var $this_add_to_cart =  $(this).closest(".js-product-container").find(".js-prod-submit-form");
                // Get the current product discount percentage value
                var current_percentage_value = $this_product_container.find(".js-offer-percentage");
                // Get the current product price and promotional price
                var compare_price_value = $this_compare_price.html();
                var price_value = $this_price.html();
                // Filter prices to only have numbers
                old_price_value_filtered = parseInt(compare_price_value.replace(/[^0-9]/gi, ''), 10)/100;
                current_price_value_filtered = parseInt(price_value.replace(/[^0-9]/gi, ''), 10)/100;
                // Calculate new discount percentage based on difference between filtered old and new prices
                price_difference = (old_price_value_filtered-current_price_value_filtered);
                updated_discount_percentage = Math.round(((price_difference*100)/old_price_value_filtered));
                $this_product_container.find(".js-offer-percentage").html(updated_discount_percentage);
                if ($this_compare_price.css("display") == "none") {
                    $this_product_container.find(".js-offer-label").hide();
                }
                else {
                    $this_product_container.find(".js-offer-label").css("display" , "table");
                }
                if ($this_add_to_cart.hasClass("nostock")) {
                    $this_product_container.find(".js-stock-label").show();
                }
                else {
                    $this_product_container.find(".js-stock-label").hide();
                }
                if ($this_price.css('display') == 'none'){
                    $installment_container.hide();
                    $installment_text.hide();
                }else{
                    $installment_text.show();
                }
            });

            {% if provinces_json %}
            $('select[name="country"]').change(function () {
                var provinces = {{ provinces_json | default('{}') | raw }};
                LS.swapProvinces(provinces[$(this).val()]);
            }).change();
            {% endif %}

            $("input.shipping-zipcode").keydown(function (e) {
                var key = e.which ? e.which : e.keyCode;
                var enterKey = 13;
                if (key === enterKey) {
                    e.preventDefault();
                    $(this).parent().find(".calculate-shipping-button").click();
                }
            });

            $(".calculate-shipping-button").click(function (e) {
                e.preventDefault();
                LS.calculateShippingAjax(
                    $(this).parent().find("input.shipping-zipcode").val(),
                    '{{ store.shipping_calculator_url | escape('js') }}',
                    $(this).closest(".shipping-calculator"));
            });

            $('.sort-by').change(function () {
                var params = LS.urlParams;
                params['sort_by'] = $(this).val();
                var sort_params_array = [];
                for (var key in params) {
                    if ($.inArray(key, ['results_only', 'page']) == -1) {
                        sort_params_array.push(key + '=' + params[key]);
                    }
                }
                var sort_params = sort_params_array.join('&');
                window.location = window.location.pathname + '?' + sort_params;
            });
            $(".js-toggle-mobile-filters").click(function (e) {
                e.preventDefault();
                $(".js-mobile-filters-panel").toggleClass("animation-panel-right-open animation-panel-right-close");
                $("body").toggleClass("overflow-none");
            });

            $(".js-mobile-paginator-input").focusout(function (e) {
                e.preventDefault();
                LS.paginateMobile();
            });

            // Color variations - Used to select variants from colors/sizes squares
            $(document).on("click", "a.insta-variations", function (e) {
                e.preventDefault();
                $this = $(this);
                $this.siblings().removeClass("selected");
                $this.addClass("selected");

                var option_id = $this.data('option');
                $selected_option = $this.closest('.product').find('.js-variation-option option').filter(function () {
                    return this.value == option_id;
                });
                $selected_option.prop('selected', true).trigger('change');

                $this.closest("[class^='variation']").find('.variation-label strong').html(option_id);
            });
            // Show and hide content when doc is ready
            $(".js-hide-when-dom-ready").hide();
        });
    });
</script>

{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
<script type="text/javascript">
LS.ready.then(function(){
    $(function() {
        new LS.infiniteScroll({
            afterSetup: function() {
                $('.crumbPaginationContainer').hide();
            },
            productGridClass: 'product-table',
            finishData: function() {
                    $('#loadMoreBtn').remove();
                },
			productsPerPage: 12
        });
    });
});
</script>
{% endif %}

{% if template == 'home' %}
    <script type="text/javascript">
        LS.ready.then(function(){
            var categoriesList = $("#categories-list li");

            if (categoriesList.length > 10) {
                $("#show-more-cats").show();
                for (i = 10; i < categoriesList.length; i++) {
                    $(categoriesList[i]).hide();
                }
            }

            $("#show-more-cats").click(function(e){
                e.preventDefault();
                for (i = 10; i < categoriesList.length; i++) {
                    $(categoriesList[i]).toggle();
                }
                $(this).find("i").toggleClass("fa-angle-up fa-angle-down");
            });
        });
    </script>
{% endif %}

{% if template == 'cart' %}
<script type="text/javascript">
LS.ready.then(function(){
    $(document).ready(function(){

        // Clicked shipping method listener       
        $(document).on( "click", "input.shipping-method", function() {
            var elem = $(this);
            var shippingPrice = elem.attr("data-price");
            elem.click(function() {
                LS.addToTotal(shippingPrice);               
            });
            $('.shipping-suboption').hide();
            elem.closest('li').find('.shipping-suboption').show();
        });

        // Default shipping method listener
        $('input.shipping-method:checked').livequery(function(){ 
            var shippingPrice = $(this).attr("data-price");     
            LS.addToTotal(shippingPrice);
        }); 

    });
});
</script>
{% endif %}
{% if template == 'product' %}
{{ "js/jquery.thumbnailScroller.js" | static_url | script_tag }}
<script type="text/javascript">
LS.ready.then(function(){
    $(document).ready(function(){
        slider = $('#productbxslider').bxSlider({
            onSliderLoad: function(){
                //Add class to active slider image
                $('#productbxslider.bxslider > li').eq(1).addClass('js-product-active-image');
                $(".js-product-slider-placeholder, .js-product-detail-loading-icon").hide();
                $("#productbxslider").css("visibility", "visible");
                $("#productbxslider").css("height", "auto");
                $(".js-product-detail-slider").css({"visibility" : "visible", "height" : "auto"});
            },
            onSlideAfter: function (currentSlideNumber, totalSlideQty, currentSlideHtmlObject) {
                $('#productbxslider .js-product-active-image').removeClass('js-product-active-image');
                //Add class to active slider image
                $('#productbxslider.bxslider > li').eq(currentSlideHtmlObject + 1).addClass('js-product-active-image');
            },
            nextText:'<i class="fa fa-chevron-right"></i>',
            prevText:'<i class="fa fa-chevron-left"></i>',

        });
        {% if product.images_count > 1 %}
            LS.registerOnChangeVariant(function(variant){
                var liImage = $('#productbxslider').find("[data-image='"+variant.image+"']");
                var selectedPosition = liImage.data('image-position');
                var slideToGo = parseInt(selectedPosition);
                slider.goToSlide(slideToGo);
            });
        {% endif %}

        $('.product-share-button').click(function(){
            ga_send_event('social-sharing-product', $(this).data('network'))
        });

        $('.js-mobile-social-share').click(function(){
            ga_send_event('mobile-social-sharing-product', $(this).data('network'));
        });

        $('.js-product-detail-payment-logo').click(function(){
            ga_send_event('product-detail-payment-logo');
        });


        $("#tS3").thumbnailScroller({
            scrollerType:"hoverAccelerate",
            scrollerOrientation:"vertical",
            acceleration:0,
            noScrollCenterSpace:100,
            autoScrolling:0,
            autoScrollingSpeed:2000,
            autoScrollingEasing:"easeInOutQuad",
            autoScrollingDelay:500
        });


        {# Mobile Zoom #}

        //Save scrolling position for fixed body on Mobile Zoom opened
        var scrollPos = $(document).scrollTop();
        $(window).scroll(function(){
            scrollPos = $(document).scrollTop();
        });
        var savedScrollPos = scrollPos;

        // Add tap class to product image
        if ($(window).width() < 768) {
            $(".js-image-open-mobile-zoom").addClass("js-open-mobile-zoom");
        }

        // Mobile zoom open event
        $(".js-open-mobile-zoom").click(function(e){
            e.preventDefault();
            savedScrollPos = scrollPos;
            $('body').css({
                position: 'fixed',
                top: -scrollPos
            });
            LS.openMobileZoom();
        });

        // Mobile zoom close event
        $(".js-close-mobile-zoom").click(function(e){
            e.preventDefault();
            LS.closeMobileZoom(150);
        });

        $('.social-widgets-mobile_btn_pinterest').click(function(e){
           e.preventDefault();
           $(".shareItem.pinterest span").click();
        });
        // Mobile custom variants improvements
        $(document).on("click", ".js-mobile-vars-btn", function(e) {
          $(this).next(".js-mobile-vars-panel").removeClass('js-var-panel animation-panel-right-close').addClass('js-var-panel animation-panel-right-open');
          $(this).closest(".modal").scrollTop(0), "fast";
          $("body").addClass("overflow-none");
        });
        function closeVarPanel() {
        setTimeout(function(){ 
            $('.js-var-panel').removeClass('js-var-panel animation-panel-right-open').addClass('js-var-panel animation-panel-right-close')}, 300);
            $("body").removeClass("overflow-none");
        };
        $(document).on("click", ".js-close-panel", function(e) {
          closeVarPanel();
        });
        $(".js-quickshop-mobile-vars-property").on( "click", function() {
          $(this).closest(".modal").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars_btn").offset().top);
          closeVarPanel();
        });
        $(".js-mobile-vars-property").on( "click", function() {
          var selectedoption = $(this).data("option");
          var varname = $(this).closest(".js-mobile-vars-panel").data("custom");
          $(this).closest(".js-mobile-vars").find("span.js-mobile-vars_selected-label").html(selectedoption);
          $(this).closest("#single-product-container").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars-btn").offset().top);
          closeVarPanel();
        });
        $(document).on("click", ".js-mobile-vars-property", function(e) {
            e.preventDefault();
            $this = $(this);
            $this.siblings().removeClass("selected");
            $this.addClass("selected");
            var option_id = $this.data('option');
            $selected_option = $this.closest('.js-mobile-variations-container').find('.js-variation-option option[value="'+option_id+'"]');
            $selected_option.prop('selected', true).trigger('change');
        });

        {# Installments details #}

        {% if store.installments_on_steroids_enabled %}

            // Installments details flags and selects
            $(".js-installments-bank-select optgroup:not(:has(option))").hide(); 
            $('.js-installment-select').on('change', function() {
                $(".js-installments-container").removeClass("js-installments-container-active");
                var $installments_container = $(this).closest(".js-installments-container").addClass("js-installments-container-active");
                var $active_installment_amount = $(this).find(':selected').addClass('js-amount-selected').siblings('option').removeClass('js-amount-selected');
                var installment_select_value = $(this).val();
                $(".js-installments-container-active .js-installment-price").hide();
                var $installment_price_to_show = $installments_container.find('.'+installment_select_value);
                $installment_price_to_show.show();
            });

            $(".js-installments-flag-tab").click(function(e){
                e.preventDefault();
                var $main_container = $(this).closest(".js-gw-tab-pane");
                $main_container.find(".js-installments-flag-tab").not(this).removeClass("active");
                ga_send_event('installments-flags-clicks', 'clicks');
            });
            $(".js-installments-cash-tab").click(function(e){
                e.preventDefault();
                var $main_container = $(this).closest(".js-gw-tab-pane");
                $main_container.find(".js-credit-cart-tab-pane.active").removeClass("active");
                $main_container.find(".js-installments-final-info").hide();
                $main_container.find(".js-cash-final-info").show();
            });

            $(".js-installments-credit-tab").click(function(){
                var $main_container = $(this).closest(".js-gw-tab-pane");

                // Show the correct installment value related to each credit card
                $main_container.find(".js-installments-final-info").show();
                $main_container.find(".js-cash-final-info").hide();
                var current_credit_card_id_val = $(this).attr("id"); 
                $main_container.find(".js-installment-select").hide().removeClass("active");
                $main_container.find(".js-installment-select-container").hide().removeClass("active");
                $main_container.find('.'+current_credit_card_id_val).show().addClass("active");

                // Update the installment depending the selected credit card
                $(".js-gw-tab-pane.active .js-installments-container").removeClass("js-installments-container-active");
                var $installments_container = $main_container.find(".js-installment-select.active").closest(".js-installments-container").addClass("js-installments-container-active");
                var $active_installment_amount = $main_container.find('.js-installment-select.active option:selected').addClass('js-amount-selected').siblings('option').removeClass('js-amount-selected');
                var installment_select_value = $main_container.find('.js-installment-select.active').val();
                $(".js-gw-tab-pane.active .js-installment-price").hide();
                var $installment_price_to_show = $installments_container.find('.'+installment_select_value);
                $installment_price_to_show.show();
                $(".js-installment-single-select").show().addClass("active");
            });

            // Installments details refresh data
            $("li[data-type='cc'].installments-card").click(function(e){
                var active_card = $(this).data("code");
                refreshInstallmentData(active_card);
            });

            $(".js-installments-bank-select, .js-installment-select, .js-variation-option").change(function(e){
                var active_card = $(".js-gw-tab-pane.active .js-installments-flag-tab.active").data("code");
                refreshInstallmentData(active_card);
            });

            $("#button-installments, .js-mobile-toggle-installments, .js-installments-gw-tab").click(function(e){
                var active_card = $(".js-gw-tab-pane.active .js-installments-flag-tab.active").data("code");
                refreshInstallmentData(active_card);
            });

            $(".js-installments-gw-tab").click(function(e){
                setTimeout(function() {
                    var active_card = $(".js-gw-tab-pane.active .js-installments-flag-tab.active").data("code");
                    refreshInstallmentData(active_card);
                }, 10);
            });

            $(".js-installments-bank-select").change(function(e){
                var $main_container = $(this).closest(".js-gw-tab-pane");
                $main_container.find(".js-credit-cart-tab-pane.active .js-bank-not-selected-error").hide();
                var $disabled_installment_select = $(".js-installment-select:visible:disabled");
                $disabled_installment_select.prop('disabled', false).addClass("enabled");
                $(".js-installment-select:visible.enabled").next(".js-installment-select-container").remove();
            });

            $(".js-installment-select-container").click(function(e){
                var $main_container = $(this).closest(".js-gw-tab-pane");
                $main_container.find(".js-credit-cart-tab-pane.active .js-bank-not-selected-error").show();
                e.preventDefault();
            });
            
            $(".js-installments-accept-button").click(function(){
                var selected_gw = $(".js-installments-gw-tab.active a").text();
                var selected_gw_code = $(".js-installments-gw-tab.active").data('code');
                sessionStorage.setItem('installments-selected-gw-code', selected_gw_code);
                sessionStorage.setItem('installments-selected-gw-name', selected_gw.toLowerCase());
                $("input[name=preselected_gw_code]").val(selected_gw_code);
                $(".js-installments-selected-gw").text(selected_gw.toLowerCase());
                $(".js-installments-selected-gw-container").show();
            });

            $(document).ready(function() {
                if(sessionStorage.getItem('installments-selected-gw-code')){
                    $("input[name=preselected_gw_code]").val(sessionStorage.getItem('installments-selected-gw-code'));
                    $(".js-installments-selected-gw").text(sessionStorage.getItem('installments-selected-gw-name'));
                    $(".js-installments-selected-gw-container").show();
                    $(".js-installments-gw-tab.active").removeClass("active");
                    $(".js-gw-tab-pane.active").removeClass("active");
                    $("#method_" + sessionStorage.getItem('installments-selected-gw-code')).addClass("active");
                    $("#installment_" + sessionStorage.getItem('installments-selected-gw-code') + "_").addClass("active");
                }
            });

            function refreshInstallmentData(active_card) {
                var installment = Number($(".js-gw-tab-pane.active select.js-installments-card-" + active_card + " option:selected").data('number'));
                var installment_value = $(".js-gw-tab-pane.active select.js-installments-card-" + active_card + " option:selected").val();
                var total_value_one_payment = Number($(".js-installments-one-payment").attr("data-value"));

                if ($('.js-installments-cft-value').length) {
                    //CFT
                    var cft = $(".js-gw-tab-pane.active select[data-card=" + active_card + "] option:selected").data("cft-" + installment);
                    $(".js-gw-tab-pane.active .js-installments-cft-value").text(cft ? cft.toLocaleString('de-DE', {
                            maximumFractionDigits: 2,
                            minimumFractionDigits: 2
                        }) + "%" : "0,00%");

                    //TEA
                    var tea = $(".js-gw-tab-pane.active select[data-card=" + active_card + "] option:selected").data("tea-" + installment);
                    $(".js-gw-tab-pane.active .js-installments-tea").text(tea ? tea.toLocaleString('de-DE', {
                            maximumFractionDigits: 2,
                            minimumFractionDigits: 2
                        }) + "%" : "0,00%");

                    // CFT Visibility
                    if (installment == 1) {
                        $(".js-gw-tab-pane.active .js-installment-cft-container, .js-gw-tab-pane.active .js-installment-ptf-container, .js-gw-tab-pane.active .js-installment-tea-container").hide();
                    } else {
                        $(".js-gw-tab-pane.active .js-installment-cft-container, .js-gw-tab-pane.active .js-installment-ptf-container, .js-gw-tab-pane.active .js-installment-tea-container").show();
                    }
                }

                //Total Price
                if (cft == 0) {
                    $(".js-gw-tab-pane.active .js-installments-ptf").text($(".js-gw-tab-pane.active strong.js-installments-one-payment").text());
                    $(".js-gw-tab-pane.active ." + installment_value + " .installment-price").text(LS.currency.display_short + (total_value_one_payment/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                    $(".js-installments-container-active .js-installment-without-int-text").show();
                } else {
                    var base_price = Number($("#price_display").attr("content"));
                    var installment_price_container = $(".js-gw-tab-pane.active ." + installment_value + " .installment-price");
                    installment_price_container.text(LS.currency.display_short + Number(installment_price_container.attr("data-value")).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                    var total_value = installment * priceToFloat($(".js-gw-tab-pane.active ." + installment_value + " .installment-price").text());
                    total_value = ((Math.abs(base_price - total_value) < 0.07) ? base_price : total_value);
                    $(".js-gw-tab-pane.active .js-installments-ptf").text(LS.currency.display_short + total_value.toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                    if (total_value != $(".js-gw-tab-pane.active .js-installment-number-0 .installment-price").attr("data-value")) {
                        $(".js-gw-tab-pane.active .js-installment-without-int-text").hide();
                    } else {
                        $(".js-gw-tab-pane.active .js-installment-without-int-text").show();
                    }
                }
                if ($(".js-gw-tab-pane.active .js-installments-ptf").text().trim() == $('.js-gw-tab-pane.active .js-installment-legal-info .js-installments-one-payment').text().trim()) {
                    $(".js-gw-tab-pane.active .js-installments-cft-value").text("0,00%");
                    $(".js-gw-tab-pane.active .js-installments-tea").text("0,00%");
                    $(".js-gw-tab-pane.active ." + installment_value + " .installment-price").text(LS.currency.display_short + (total_value_one_payment/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                    $(".js-gw-tab-pane.active .js-installment-without-int-text").show();
                }
            }

            function priceToFloat(price){
                return parseFloat(price.replace(/[^\d,]/g,'').replace(/[,]/g,'.'));
            }

            var device = ($(window).width() > 769 ? 'desktop' : 'mobile');
            $(".js-open-installments-modal-" + device).click(function(e){
                ga_send_event("installments-opened-"  + device, 'clicks');
            });

            if ($(window).width() > 769) {
                $(".js-product-detail-payment-logo").click(function(e){
                    ga_send_event("installments-opened-desktop", 'clicks');
                });
            }
            
        {% endif %}

        // Installments details - Mobile
        if ($(window).width() < 768) {
            $(".js-mobile-toggle-installments").click(function(e){
                e.preventDefault();
                if(!$(".js-installments-details-container").hasClass("js-installments-details-detached")){
                    $(".js-installments-details-container").detach().appendTo('.js-mobile-installments-body');
                }
                $(".js-mobile-installments-panel").toggleClass("animation-panel-right-open animation-panel-right-close");
                $("body").toggleClass("overflow-none");
                $(".js-installments-details-container").addClass("js-installments-details-detached");
            });
        }
    });
});
</script>
{% endif %}
<script type="text/javascript">
    LS.ready.then(function(){
        $(document).ready(function(){
            {# 404 handling to show the example product #}
            if ( window.location.pathname === "/product/example/" ) {
                document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
                $("#404").hide();
                $("#product-example").show();
            } else {
                $("#product-example").hide();
            }
        });
    });
</script>
{% if store.live_chat %}
<!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
/* custom configuration goes here (www.olark.com/documentation) */
olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/</script>
<!-- end olark code -->
{% endif %}
{{ store.assorted_js | raw }}

{{ '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js' | script_tag(async_js) }}
</body>
</html>
