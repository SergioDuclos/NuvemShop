<div class="page-content">
    <div class="headerBox-Page">
        <h1>{{ "Mi cuenta" | translate }}</h1>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper visible-when-content-ready">
        <form action="" method="post" class="contact_form">
            <div class="field">
                <div class="span1">
                    <label for="name">{{ 'Nombre' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="name" id="name" value="{{ result.name | default(customer.name) }}" {% if result.errors.name %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.name %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="span3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email | default(customer.email) }}" {% if result.errors.email == 'exists' or result.errors.email %} class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="st error c alert alert-danger">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar un email válido!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="phone" id="phone" value="{{ result.phone | default(customer.phone) }}" />
                </div>
            </div>
            <input class="submit_button" type="submit" value="{{ 'Guardar cambios' | translate }}" />
        </form>
    </div>
</div>