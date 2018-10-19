{% set show_help = not (settings.slider | length) and not ("banner-home.jpg" | has_custom_image) and not has_products %}
<div class="sections {% if show_help %}no-products{% endif %}">
    {% if show_help %}
    <div class="headerBox-Page">
        <h2>{{"¡Bienvenido a tu tienda!" | translate}}</h2>
    </div>  
    {% endif %}
</div>

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# This will show default products in the home page before you upload some products #}
{% if show_help %}
    <div class="hidden-phone">
        {% snipplet 'defaults/show_help.tpl' %}
    </div>
    <div class="visible-phone">
        {% snipplet 'defaults/show_help_category.tpl' %}
    </div>
{% endif %}
{# END of show default products in the home page #}

<div class="row-fluid">
    <div class="contentBox js-home-slider-container home-slider-container slider-wrapper theme-light {% if not settings.slider or settings.slider is empty %}hidden{% endif %}">
        {% snipplet 'placeholders/home-slider-placeholder.tpl' %}
        <div class="js-home-slider-preloader home-slider_refresh-icon svg_loading-icon p-absolute rotate opacity-80">
            <svg baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="598 -476.1 1792 1792"><path d="M2237 579.9c0 3.3-.3 5.7-1 7-42.7 178.7-132 323.5-268 434.5s-295.3 166.5-478 166.5c-97.3 0-191.5-18.3-282.5-55s-172.2-89-243.5-157l-129 129c-12.7 12.7-27.7 19-45 19s-32.3-6.3-45-19-19-27.7-19-45v-448c0-17.3 6.3-32.3 19-45s27.7-19 45-19h448c17.3 0 32.3 6.3 45 19s19 27.7 19 45-6.3 32.3-19 45l-137 137c47.3 44 101 78 161 102s122.3 36 187 36c89.3 0 172.7-21.7 250-65s139.3-103 186-179c7.3-11.3 25-50.3 53-117 5.3-15.3 15.3-23 30-23h192c8.7 0 16.2 3.2 22.5 9.5s9.5 13.8 9.5 22.5zm25-800v448c0 17.3-6.3 32.3-19 45s-27.7 19-45 19h-448c-17.3 0-32.3-6.3-45-19s-19-27.7-19-45 6.3-32.3 19-45l138-138c-98.7-91.3-215-137-349-137-89.3 0-172.7 21.7-250 65s-139.3 103-186 179c-7.3 11.3-25 50.3-53 117-5.3 15.3-15.3 23-30 23H776c-8.7 0-16.2-3.2-22.5-9.5s-9.5-13.8-9.5-22.5v-7c43.3-178.7 133.3-323.5 270-434.5s296.7-166.5 480-166.5c97.3 0 192 18.5 284 55.5s173.7 89.2 245 156.5l130-129c12.7-12.7 27.7-19 45-19s32.3 6.3 45 19c12.7 12.7 19 27.7 19 45z"/></svg>
        </div>
        <ul class="js-home-slider homeslider bxslider" style="visibility:hidden; height:0;">
            {% if settings.slider and settings.slider is not empty %}
                {% for slide in settings.slider %}
                    {% set slide_img = slide.image | static_url %}
                    {% if slide.link is empty %}
                        <li><img src="{{ slide_img }}" style="visibility: hidden;"/></li>
                    {% else %}
                        <li><a href="{{ slide.link }}"><img src="{{ slide_img }}" style="visibility: hidden;"/></a></li>
                    {% endif %}
                {% endfor %}
            {% endif %}
        </ul>
    </div>
</div>
{% if settings.banner_services_home %} 
     {% include 'snipplets/banner-services/banner-services.tpl' %}
{% endif %} 
{% if settings.welcome_message %}
	<div class="row-fluid {% if not (settings.banner_services_home and settings.slider) %}m-half-top-xs{% endif %}">
    	<div class="headerBox">
			<h2>{{ settings.welcome_message }}</h2>
		</div>
	</div>
{% endif %}

{% if categories %}
    {% include 'snipplets/home-categories.tpl' %}
{% endif %}
{% if sections.primary.products %}
    <div class="row-fluid home-prods">
        {% if categories %}
            <div class="span2 left-col hidden-phone visible-when-content-ready">
                {% snipplet 'sidebar-home.tpl' %}
            </div>
        {% endif %}
        <div class="{% if categories %}span10 {% else %}span12 {% endif %}home-grid right-col">
            <h2 class="featured-products-header m-top m-half-top-xs m-half-bottom-xs p-half-left-xs">{{"Productos destacados" | translate}}</h2>
            <div class="product-table">
            {% for product in sections.primary.products %}
                {% if loop.index % 4 == 1 %}
                <div class="product-row">
                {% endif %}

                {% include 'snipplets/single_product.tpl' %}

                {% if loop.index % 4 == 0 or loop.last %}
                </div>
                {% endif %}
            {% else %}
                {% if show_help %}
                    {% for i in 1..4 %}
                        {% if loop.index % 4 == 1 %}
                            <div class="product-row">
                        {% endif %}

                        <div class="span3">
                            <div class="dest-gral" style="opacity:0.5;">
                                <div class="head">
    								<a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                                </div>
                                <div class="bajada">
                                    <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                                    <div class="price">{{"$0.00" | translate}}</div>
                                </div>
                            </div>
                    	</div>

                        {% if loop.index % 4 == 0 or loop.last %}
                            </div>
                        {% endif %}
                    {% endfor %}
                {% endif %}
            {% endfor %}
            </div>
            <div class="container-see-all-prods text-center clear visible-when-content-ready">
                <a href="{{ store.products_url }}" class="btn-see-all-prods button secondary d-inline-block m-top m-bottom p-left p-right">{{ "Ver todos los productos" | translate }}</a>
            </div>
        </div>
    </div>
{% endif %}


<!-- Modal -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}

{% if "banner-home.jpg" | has_custom_image %}
	<div class="row-fluid visible-when-content-ready">
        <div class="banner">
            {% if settings.banner_home_url != '' %}
                {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
            {% else %}
                {{ "banner-home.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    </div>
{% endif %}

<div class="row-fluid sb facebook-widget-row visible-when-content-ready">

    {% if settings.show_footer_fb_like_box and store.facebook %}
        <div class="home_social-widget visible-when-content-ready span{% if settings.twitter_widget %}6{% else %}12{% endif %}" style="overflow:hidden;">
            <div class="social-title">
                <h2>{{"Síguenos en Facebook" | translate}}</h2>
            </div>
            <div style="margin:10px 0;">
                {{ store.facebook | fb_page_plugin(980,200) }}
            </div>
        </div>
    {% endif %}

    {% if settings.twitter_widget %}
		<div class="home_social-widget visible-when-content-ready span{% if settings.show_footer_fb_like_box and store.facebook %}6{% else %}12{% endif %}">
            <div class="social-title">
                <h2>{{"Síguenos en Twitter" | translate}}</h2>
            </div>

			<div class="row-fluid tw">
            	<div class="twitter-time">
                    {{ settings.twitter_widget | raw }}
				</div>
			</div>
  		</div>
    {% endif %}
</div>
