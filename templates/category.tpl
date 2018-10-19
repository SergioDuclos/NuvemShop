{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}
<div class="row-fluid categoria">    
    <div class="headerBox-List p-none-xs">
        <div class="span6">
            {% snipplet "breadcrumbs.tpl" %}
        	<h1>{{ category.name }}</h1>
        </div>
    </div>
</div>
<div class="banner-services-category m-half-bottom-xs m-half-top-xs">
    {% if settings.banner_services_category %} 
        {% include 'snipplets/banner-services/banner-services.tpl' %}
    {% endif %} 
</div>

{% if "banner-products.jpg" | has_custom_image %}
<div class="row-fluid">
    <div class="banner">
        {% if settings.banner_products_url != '' %}
            {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
        {% else %}
            {{ "banner-products.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
</div>
{% endif %}

<div class="row-fluid categoria p-half-top-xs">  
    <div class="text-right text-left-xs sort-by-container">
        {% snipplet 'sort_by.tpl' %}
    </div>
    {% if has_filters %}
        <a href="#" class="js-toggle-mobile-filters button secondary mobile-filters-btn visible-phone p-relative">
            <span class="m-half-right">{{ 'Filtrar' | translate }}</span>
            <i class="fa fa-filter mobile-filters-btn_icon p-absolute"></i>
        </a>
    {% endif %}
</div>

{% if not show_help %}
<div class="row-fluid">
    {% if show_sidebar %} 
        {% snipplet 'sidebar.tpl' %}
    {% endif %} 
    <div {% if show_sidebar %}class="span10"{% else %}class="span12"{% endif %}>
    {% if products %}
        <div class="product-table">
            {% snipplet "product_grid.tpl" %}
        </div>
        {% if settings.infinite_scrolling and not pages.is_last and products %}
             <div class="load-more-container m-none-xs visible-when-content-ready">
                <a id="loadMoreBtn" class="button secondary"><i class="fa fa-refresh fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
            </div>
        {% endif %}
         <div class="crumbPaginationContainer bottom" {% if settings.infinite_scrolling %}style="display:none"{% endif %}>
            <div class='pagination'>
                {% snipplet "pagination.tpl" %}
            </div>
        </div>
    {% else %}

        <div class="filters-msg">
            {{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
        </div>
    {% endif %}
    </div>
</div>
{% elseif show_help %}
    {% snipplet 'defaults/show_help_category.tpl' %}
{% endif %}
{% if has_filters %}
    {% snipplet 'mobile-filters.tpl' %}
{% endif %}
