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
                    <input type="text" name="name" id="name" value="{{ result.name | default(address.name) }}"  {% if result.errors.name %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.name %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="address">{{ 'Dirección' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="address" id="address" value="{{ result.address | default(address.address) }}" {% if result.errors.address %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.address %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar tu dirección!' | translate }}</div>
            {% endif %}
            {% if current_language.country == 'BR' %}
                <div class="field">
                    <div class="span1">
                        <label for="number">{{ 'Número' | translate }}</label>
                    </div>
                    <div class="span3">
                        <input type="text" name="number" id="number" value="{{ result.number | default(address.number) }}" {% if result.errors.number %}class="input-error"{% endif %}/>
                    </div>
                </div>
                {% if result.errors.number %}
                    <div class="st error c alert alert-danger">{{ 'Debes ingresar tu número!' | translate }}</div>
                {% endif %}
                <div class="field">
                    <div class="span1">
                        <label for="floor">{{ 'Piso' | translate }}</label>
                    </div>
                    <div class="span3">
                        <input type="text" name="floor" id="floor" value="{{ result.floor | default(address.floor) }}" {% if result.errors.floor %}class="input-error"{% endif %}/>
                    </div>
                </div>
                {% if result.errors.floor %}
                    <div class="st error c alert alert-danger">{{ 'Debes ingresar tu piso!' | translate }}</div>
                {% endif %}
                <div class="field">
                    <div class="span1">
                        <label for="locality">{{ 'Localidad' | translate }}</label>
                    </div>
                    <div class="span3">
                        <input type="text" name="locality" id="locality" value="{{ result.locality | default(address.locality) }}" {% if result.errors.locality %}class="input-error"{% endif %}/>
                    </div>
                </div>
                {% if result.errors.locality %}
                    <div class="st error c alert alert-danger">{{ 'Debes ingresar tu localidad!' | translate }}</div>
                {% endif %}
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="zipcode">{{ 'Código Postal' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="zipcode" id="zipcode" value="{{ result.zipcode | default(address.zipcode) }}" {% if result.errors.zipcode %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.zipcode %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar tu código postal!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="city">{{ 'Ciudad' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="city" id="city" value="{{ result.city | default(address.city) }}" {% if result.errors.city %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.city %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar tu ciudad!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="province">{{ 'Provincia' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="province" id="province" value="{{ result.province | default(address.province) }}" {% if result.errors.province %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.province %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar tu provincia!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="country">{{ 'País' | translate }}</label>
                </div>
                <div class="span3">
                    <select name="country" id="country">{{ country_options }}</select>
                </div>
            </div>
            {% if result.errors.country %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar tu país!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="phone">{{ 'Teléfono' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="phone" id="phone" value="{{ result.phone | default(address.phone) }}" {% if result.errors.phone %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.phone %}
                <div class="st error c alert alert-danger">{{ 'Debes ingresar tu teléfono!' | translate }}</div>
            {% endif %}
            <input class="submit_button" type="submit" value="{{ 'Guardar cambios' | translate }}" />
        </form>
    </div>
</div>
