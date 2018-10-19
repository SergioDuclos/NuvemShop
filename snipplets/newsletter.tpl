{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}
<div id="newsletter">
    {% if contact and contact.type == 'newsletter' %}
        {% if contact.success %}
            <div class="contact-ok alert alert-success text-center">{{ "Se inscribió al newsletter correctamente." | translate }}</div>
        {% else %}
            <div class="contact-error alert alert-danger text-center">{{ "Ingresa tu email" | translate }}</div>
        {% endif %}
    {% endif %}

<form method="post" action="/winnie-pooh">
        <div class="input-append news">
            <input type="text" name="name" class="span2 news mandatory-field" onfocus="if (this.value == '{{ "Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Nombre" | translate }}' />
            <input type="text" class="span2 news mandatory-field" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email" >
        <div class="winnie-pooh">
            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
        </div>
            <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
            <input type="hidden" name="type" value="newsletter-popup" />
            <input type="submit" name="contact" class="btn news" value='{{ "Enviar" | translate }}'>
        </div>
</form>
</div>