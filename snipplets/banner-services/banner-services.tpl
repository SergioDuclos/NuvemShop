{# Desktop Banner Services #}
{% macro for_each_banner_include(template) %}
    {% set num_banners_services = 0 %}
    {% set available_banners = []%}
    {% for banner in ['banner_services_01', 'banner_services_02', 'banner_services_03'] %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set has_banner_services =  banner_services_title or banner_services_description %}
        {% if has_banner_services %}
            {% set num_banners_services = num_banners_services + 1 %}
            {% set available_banners = available_banners | merge([banner]) %}
        {% endif %}
    {% endfor %}
    {% for banner in available_banners %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% include template %}
    {% endfor %}
{% endmacro %}
{% import _self as banner_services %}
<div class="row-fluid hidden-phone">
    <div class="container banner-services p-half-top-xs m-haf-top-xs">
        {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item-container.tpl') }}
    </div>
</div>

{# Mobile Banner Services #}
<div class="row-fluid visible-phone mobile-banner-services">
    {% snipplet 'placeholders/banner-services-placeholder.tpl' %}
    <div class="js-mobile-services-banner container bx-slider banner-services banner-services-slider" style="visibility:hidden; height:0;">
        {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item-container-mobile.tpl') }}
    </div>
</div>