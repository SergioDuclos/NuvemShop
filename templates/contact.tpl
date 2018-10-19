<div class="page-content contacto">	

	<div class="headerBox-Page">
		<h1>{{ "Contacto" | translate }}</h1>
	</div>
    {% snipplet "breadcrumbs.tpl" %}
    {# Page preloader #}
    <div class="page_loading-icon-container full-width hidden-when-content-ready">
        <div class="page_loading-icon svg_loading-icon opacity-80 rotate">
            <svg baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="598 -476.1 1792 1792"><path d="M2237 579.9c0 3.3-.3 5.7-1 7-42.7 178.7-132 323.5-268 434.5s-295.3 166.5-478 166.5c-97.3 0-191.5-18.3-282.5-55s-172.2-89-243.5-157l-129 129c-12.7 12.7-27.7 19-45 19s-32.3-6.3-45-19-19-27.7-19-45v-448c0-17.3 6.3-32.3 19-45s27.7-19 45-19h448c17.3 0 32.3 6.3 45 19s19 27.7 19 45-6.3 32.3-19 45l-137 137c47.3 44 101 78 161 102s122.3 36 187 36c89.3 0 172.7-21.7 250-65s139.3-103 186-179c7.3-11.3 25-50.3 53-117 5.3-15.3 15.3-23 30-23h192c8.7 0 16.2 3.2 22.5 9.5s9.5 13.8 9.5 22.5zm25-800v448c0 17.3-6.3 32.3-19 45s-27.7 19-45 19h-448c-17.3 0-32.3-6.3-45-19s-19-27.7-19-45 6.3-32.3 19-45l138-138c-98.7-91.3-215-137-349-137-89.3 0-172.7 21.7-250 65s-139.3 103-186 179c-7.3 11.3-25 50.3-53 117-5.3 15.3-15.3 23-30 23H776c-8.7 0-16.2-3.2-22.5-9.5s-9.5-13.8-9.5-22.5v-7c43.3-178.7 133.3-323.5 270-434.5s296.7-166.5 480-166.5c97.3 0 192 18.5 284 55.5s173.7 89.2 245 156.5l130-129c12.7-12.7 27.7-19 45-19s32.3 6.3 45 19c12.7 12.7 19 27.7 19 45z"/></svg>
        </div>
    </div>
    {% if "foto-contacto.jpg" | has_custom_image %}
        <div class="row-fluid visible-when-content-ready">
            <div class="banner">
                {% if settings.foto_contacto_url != '' %}
                    {{ "foto-contacto.jpg" | static_url | img_tag | a_tag(settings.foto_contacto_url) }}
                {% else %}
                    {{ "foto-contacto.jpg" | static_url | img_tag }}
                {% endif %}
            </div>
        </div>
    {% endif %}
	<div class="row-fluid visible-when-content-ready">
		<div class="contact">
            <div class="span6">
                {% if store.contact_intro %}
                    <p>{{ store.contact_intro }}</p>
                {% endif %}
                <div class="row-fluid info">
                    <div class="span6">
                        {% if store.phone %}
                            <li><i class="fa fa-phone"></i><a href="tel:{{ store.phone }}" class="text-decoration-none">{{ store.phone }}</a></li>
                        {% endif %}
                        {% if store.email %}
                            <li><i class="fa fa-envelope"></i><strong>{{ store.email | mailto }}</strong></li>
                        {% endif %}
                        {% if store.blog %}
                            <li><i class="fa fa-comment"></i><a target="_blank" href="{{ store.blog }}">{{ "Visita nuestro Blog!" | translate }}</a></li>
                        {% endif %}
                        {% if store.address %}
                            <li><i class="fa fa-map-marker"></i>{{ store.address }}</li>
                        {% endif %}
                    </div>
                    <div class="span6">
                        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                                <li class="{{ sn }}"><i {% if sn == 'google_plus' %} class="fa fa-google-plus" {% else %} class="fa fa-{{ sn }}" {% endif %}></i>
                                <a target="_blank" href="{{ sn_url }}">{{ "Siguenos en {1}" | translate(sn | replace('_', ' ') | capitalize) }}</a></li>
                            {% endif %}
                        {% endfor %}
                    </div>
                </div>
            </div>
            
            <div class="span6">
                <div class="form">
                    {% if product %}
                        <div class="field prod-consult">
                            <div class="span3">
                                <label>
                                    {{ "Consulta por:" | translate }} {{ product.name | a_tag(product.url) }}
                                </label>
                            </div>
                            <div class="span9">
                                <img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.featured_image.alt }}" />
                            </div>
                        </div>
                    {% endif %}
                    {% if contact and contact.type == 'contact' %}
                        {% if contact.success %}
                            <div class="alert alert-success">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
                        {% else %}
                            <div class="alert alert-danger">{{ "Debes completar los datos de contacto." | translate }}</div>
                        {% endif %}
                    {% endif %}
                
                    <form class="contact_form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                        <input type="hidden" value="{{ product.id }}" name="product"/>
                        <input type="hidden" name="type" value="contact" />
        
                        <div class="field">
                        	<div class="span3">
                            <label for="name">{{ "Nombre" | translate }}</label>
                            </div>
                            <div class="span9">
                            <input type="text" id="name" name="name"/>
                            </div>
                        </div>
                    
                        <div class="field">
                        	<div class="span3">
                            <label for="email">{{ "Email" | translate }}</label>
                            </div>
                            <div class="span9">
                            <input type="text" id="email" name="email"/>
                            </div>
                        </div>
        
                        <div class="field winnie-pooh">
                            <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh" type="text" name="winnie-pooh"/>
                        </div>
        
                        <div class="field">
                            <div class="span3">
                            <label for="phone">
                                {{ "Teléfono" | translate }}<br/>
                                <span class="mini-text">({{ "Opcional" | translate }})</span>
                            </label>
                            </div>
                            <div class="span9">
                            <input type="text" id="phone" name="phone"/>
                            </div>
                        </div>
                    
                        <div class="field">
                        	<div class="span3">
                            <label for="message">
                                {{ "Mensaje" | translate }}<br/>
                                <span class="mini-text">({{ "Opcional" | translate }})</span>
                            </label>
                            </div>
                            <div class="span9">
                            <textarea id="message" name="message" cols="20" rows="5"></textarea>
                            <input type="hidden" value="contact" name="type"/>
                            <input type="submit" class="submit_button contact" value="{{ 'Enviar' | translate }}" name="contact"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
