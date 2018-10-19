<div class="page-content register-cont">
    <div class="headerBox-Page">
        <h1>{{ "Crear cuenta" | translate }}</h1>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    {# Page preloader #}
    <div class="page_loading-icon-container full-width js-hide-when-dom-ready">
        <div class="page_loading-icon svg_loading-icon opacity-80 rotate">
            <svg baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="598 -476.1 1792 1792"><path d="M2237 579.9c0 3.3-.3 5.7-1 7-42.7 178.7-132 323.5-268 434.5s-295.3 166.5-478 166.5c-97.3 0-191.5-18.3-282.5-55s-172.2-89-243.5-157l-129 129c-12.7 12.7-27.7 19-45 19s-32.3-6.3-45-19-19-27.7-19-45v-448c0-17.3 6.3-32.3 19-45s27.7-19 45-19h448c17.3 0 32.3 6.3 45 19s19 27.7 19 45-6.3 32.3-19 45l-137 137c47.3 44 101 78 161 102s122.3 36 187 36c89.3 0 172.7-21.7 250-65s139.3-103 186-179c7.3-11.3 25-50.3 53-117 5.3-15.3 15.3-23 30-23h192c8.7 0 16.2 3.2 22.5 9.5s9.5 13.8 9.5 22.5zm25-800v448c0 17.3-6.3 32.3-19 45s-27.7 19-45 19h-448c-17.3 0-32.3-6.3-45-19s-19-27.7-19-45 6.3-32.3 19-45l138-138c-98.7-91.3-215-137-349-137-89.3 0-172.7 21.7-250 65s-139.3 103-186 179c-7.3 11.3-25 50.3-53 117-5.3 15.3-15.3 23-30 23H776c-8.7 0-16.2-3.2-22.5-9.5s-9.5-13.8-9.5-22.5v-7c43.3-178.7 133.3-323.5 270-434.5s296.7-166.5 480-166.5c97.3 0 192 18.5 284 55.5s173.7 89.2 245 156.5l130-129c12.7-12.7 27.7-19 45-19s32.3 6.3 45 19c12.7 12.7 19 27.7 19 45z"/></svg>
        </div>
    </div>
    <div class="account-form-wrapper visible-when-content-ready">
        <form id="login-form" action="" method="post" class="contact_form">
            {% if store_fb_app_id %}
                <div class="col-sm-offset-4 col-sm-5">
                    <i class="fa fa-facebook"></i>
                    <input class="submit_button facebook" type="button" value="{{ 'Regístrate con Facebook' | translate }}" onclick="loginFacebook();" />
                </div>
                <div class="col-sm-offset-4 col-sm-5 c">
                    <span class="badge">{{ 'o' | translate }}</span>
                    <hr class="featurette-or-divider"></hr>
                </div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="name">{{ 'Nombre' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="name" id="name" value="{{ result.name }}" {% if result.errors.name %}class="input-error"{% endif %} />
                </div>
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="span3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" {% if result.errors.email == 'exists' or result.errors.email %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="alert alert-danger">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="alert alert-danger">{{ 'Debes ingresar un email válido!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="phone" id="phone" value="{{ result.phone }}" />
                </div>
            </div>
            <div class="field">
                <div class="span1">
                    <label for="password">{{ 'Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password" id="password" autocomplete="off" {% if result.errors.password == 'required' %}class="input-error"{% endif %}/>
                </div>
            </div>
             {% if result.errors.password == 'required' %}
                <div class="alert alert-danger">{{ 'Debes ingresar tu contraseña!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password_confirmation" id="password_confirmation" autocomplete="off" {% if result.errors.password == 'confirmation' %}class="input-error"{% endif %}/>
                </div>
            </div>
            {% if result.errors.password == 'confirmation' %}
                <div class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
            {% endif %}
            <input class="submit_button" type="submit" value="{{ 'Crear cuenta' | translate }}" />
        </form>
    </div>
</div>
