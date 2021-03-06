{% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
{% if product_can_show_installments %}
<div class="js-max-installments-container row-fluid">
    {% set has_payment_logos = settings.payments %}
    <div class="installments text-left-xs max_installments_container">
        {% set max_installments_without_interests = product.get_max_installments(false) %}
        {% if store.installments_on_steroids_enabled and store.country == 'AR' %}
            {% set max_installments_with_interests = product.get_max_installments %}
            {% if max_installments_with_interests %}
                {% if not has_payment_logos %}
                    <i class="fa fa-credit-card-alt js-installments-credit-card-icon installments_credit-icon pull-left opacity-80"></i>
                {% endif %}
                <div class="max-installments m-none-top d-inline">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
            {% else %}
                {% if not has_payment_logos %}
                    <i class="fa fa-credit-card-alt js-installments-credit-card-icon installments_credit-icon pull-left opacity-80" style="display: none;"></i>
                {% endif %}
                <div class="max-installments m-none-top d-inline" style="display: none;">
                {% if product.max_installments_without_interests %}
                    {{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(null, null) }}
                {% else %}
                    {{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(null, null) }}
                {% endif %}
                </div>
            {% endif %}
        {% else %}
            {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                    {% if not has_payment_logos %}
                        <i class="fa fa-credit-card-alt js-installments-credit-card-icon installments_credit-icon pull-left opacity-80"></i>
                    {% endif %}
                    <div class="max_installments d-inline">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
            {% else %}
                {% set max_installments_with_interests = product.get_max_installments %}
                {% if max_installments_with_interests %}
                    {% if not has_payment_logos %}
                        <i class="fa fa-credit-card-alt js-installments-credit-card-icon installments_credit-icon pull-left opacity-80"></i>
                    {% endif %}
                    <div class="max_installments d-inline">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                {% else %}
                    {% if not has_payment_logos %}
                        <i class="fa fa-credit-card-alt js-installments-credit-card-icon installments_credit-icon pull-left opacity-80" style="display: none;"></i>
                    {% endif %}
                    <div class="max_installments d-inline" style="display: none;">
                    {% if product.max_installments_without_interests %}
                        {{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(null, null) }}
                    {% else %}
                        {{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(null, null) }}
                    {% endif %}
                    </div>
                {% endif %}
            {% endif %}
        {% endif %}
    </div>
</div>
{% endif %}