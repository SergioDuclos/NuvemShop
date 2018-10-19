<div class="mobile-sidenav_first-row p-half-bottom">
    <span class="mobile-sidenav_close-btn p-absolute"><i class="fa fa-times menu-btn mobile-sidenav_close-btn-icon pull-right p-half-all"></i></span>
    {% if languages | length > 1 %}
        <div class="mobile-sidenav_mobile-languages languages span12 clear pull-left p-quarter-left p-half-top p-double-right">
            {% for language in languages %}
                {% set class = language.active ? "active" : "" %}
                <a href="{{ language.url }}" class="{{ class }} pull-left p-half-all border-top-none-xs border-bottom-none-xs">{{ language.country | flag_url | img_tag(language.name) }}</a>
            {% endfor %}
        </div>
    {% endif %}
    <ul class="clear-both">
        <div class="mobile-sidenav_mobile-accounts">
             {% if not customer %}
                {% if store.customer_accounts != 'mandatory' %}
                    <li>{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'd-block container text-decoration-none text-wrap no-link border-bottom-none-xs border-top-none-xs') }}</li>
                {% endif %}
                <li>{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'd-block container text-decoration-none text-wrap no-link border-top-none-xs') }}</li>
            {% else %}
                <li>{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'd-block container text-decoration-none text-wrap no-link border-bottom-none-xs border-top-none-xs') }}</li>
                <li>{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'd-block container text-decoration-none text-wrap no-link border-top-none-xs') }}</li>
            {% endif %}
        </div>
    </ul>
</div>
<div class="mobile-sidenav_second-row clear-both">
    <ul>
        {% snipplet "navigation/navigation-hamburguer-list.tpl" %}
    </ul>
</div>