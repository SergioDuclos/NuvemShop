{% if shipping_calculator_show %}
<div class="shipping-calculator text-left">
    <div class="shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
	    <span class="shipping-calculator_label text-left-xs m-half-right">{{ "Calculá el costo de tu envío" | translate }}:</span>
	    <input type="tel" name="zipcode" class="shipping-zipcode pull-left m-quarter" placeholder="{{ 'Código postal' | translate }}" value="{{ cart.shipping_zipcode }}">
	    {% if shipping_calculator_variant %}
	    <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
	    {% endif %}
	    <button class="button calculate-shipping-button secondary-button pull-left">{{ "Calcular envío" | translate }}</button>
	    <span class="loading" style="display: none;"><i class="fa fa-refresh fa-spin"></i></span>
	    <span class="js-ship-calculator-error invalid-zipcode alert alert-danger border-box clear pull-left m-half-top full-width-xs text-center-xs" style="display: none;">{{ "El código postal es inválido. Por favor intentá de nuevo usando otro." | translate }}</span>
	    <span class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger border-box clear pull-left m-half-top full-width-xs text-center-xs" style="display: none;">{{ "Ocurrió un error al calcular el envío. Por favor intentá de nuevo en unos segundos." | translate }}</span>
	    <span class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger border-box clear pull-left m-half-top full-width-xs text-center-xs" style="display: none;">{{ "El calculo falló por un problema con el medio de envío. Por favor intentá de nuevo en unos segundos." | translate }}</span>
	</div>
	<div class="shipping-calculator-response p-half-top clear-both" style="display: none;"></div>
</div>
{% endif %}