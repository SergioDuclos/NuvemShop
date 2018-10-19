<div class="banner-services-item-container m-quarter-top-xs m-quarter-bottom-xs span{{ 12 / num_banners_services }} has-{{ num_banners_services }}-banner{% if num_banners_services > 1 %}s{% endif %} text-center">
    <div class="banner-service-item m-auto">
        <div class="span3 text-right service-icon text-center-xs m-quarter-bottom-xs">
            <i class="fa {%if banner == 'banner_services_01' %}fa-truck{% endif %}{%if banner == 'banner_services_02' %}fa-credit-card{% elseif banner == 'banner_services_03' %}fa-lock{% endif %}"></i>
        </div>
        <div class="span9 text-left service-text">
            <h4 class="text-uppercase">{{ banner_services_title }}</h4>
            <p>{{ banner_services_description }}</p>
        </div>
    </div>
</div>