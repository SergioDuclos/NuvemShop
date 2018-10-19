<div class="page-content">
    <div class="headerBox-Page">
        <h1>{{ (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta') | translate }}</h1>
    </div>
    <div class="account-form-wrapper visible-when-content-ready">
        <form action="" method="post" class="contact_form">
            {% if failure %}
                <div class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="password">{{ 'Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password" id="password" autocomplete="off" {% if failure %}class="input-error"{% endif %}/>
                </div>
            </div>
            <div class="field">
                <div class="span1">
                    <label for="password_confirm">{{ 'Confirmar Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password_confirm" id="password_confirm" autocomplete="off" {% if failure %}class="input-error"{% endif %}/>
                </div>
            </div>
            <input class="submit_button" type="submit" value="{{ (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta')  | translate }}" />
        </form>
    </div>
</div>
