<div id="ajax-cart-details" class="text-left p-all p-half-all-xs p-fixed full-height" style="display: none;">
	<form action="{{ store.cart_url }}" method="post">
		<button type="button" class="button close-cart js-toggleCart secondary-button">
			<i class="fa fa-angle-left pull-left" aria-hidden="true"></i> 
			<span class="hidden-phone">{{ "Seguir comprando" | translate }}</span>
			<span class="visible-phone pull-left m-half-left">{{ "Volver" | translate }}</span>
		</button>
		{% if store.editable_ajax_cart_enabled %}
			<h3 class="m-half-bottom">{{ "Carrito de compras" | translate }}</h3>
		{% else %}
			<h3 class="m-half-bottom">{{ "Resumen del carrito de compras" | translate }}</h3>
		{% endif %}
		<div class="overflow-none ajax-cart_titles p-half-top p-half-bottom">
		  <div class="ajax-cart_titles_product-col p-half-left pull-left">
		      <h5 class="ajax-cart_titles_header font-normal text-uppercase">{{ "Producto" | translate }}</h5>
		    </div>
		    <div class="ajax-cart_titles_subtotal-col text-right p-half-right pull-right {% if store.editable_ajax_cart_enabled %}m-double-right{% endif %}">
		      <h5 class="ajax-cart_titles_header font-normal text-uppercase">{{ "Subtotal" | translate }}</h5>
		    </div>
		</div>
		<div class="ajax-cart">
			{% if cart.items %}
				{% for item in cart.items %}
					{% if store.editable_ajax_cart_enabled %}
						<div class="overflow-none ajax-cart-item productrow p-relative" data-item-id="{{ item.id }}">
							<div class="ajax-cart-item_image-col p-half-top p-half-bottom p-quarter-left p-quarter-right text-center ajax-cart-item_item-row">
							<img src="{{ item.featured_image | product_image_url('original') }}" class="ajax-cart-item_img full-width" />
							</div>
							<div class="ajax-cart-item_desc-col p-half-top p-half-right p-half-bottom p-quarter-left ajax-cart-item_item-row full-width text-wrap">
								<a class="ajax-cart-item-link" href="{{ item.url }}">{{ item.name }}</a>
								<div class="ajax-cart-item_unit-price m-quarter-top pull-left full-width">
							        {{ item.unit_price | money }}
							    </div>
							    <div class="js-ajax-cart-qty-container ajax-cart-item_qty-container pull-left m-quarter-top">
							    	<button type="button" class="item-minus js-ajax-cart-qty-btn ajax-cart-item_qty-btn pull-left m-none-top p-half-all-xs" onclick="LS.minusQuantity({{ item.id }}, true)">
										<i class="fa fa-minus ajax-cart-item_qty-btn-icon"></i></button>
						            </button>
							        <div class="quantity-input ajax-cart-item_qty-input-container pull-left">
										<input type="number" name="quantity[{{ item.id }}]" data-item-id="{{ item.id }}" value="{{ item.quantity }}" class="ajax-cart-item_qty-input pull-left m-none text-center"/>
									</div>
									<button type="button" class="item-plus js-ajax-cart-qty-btn ajax-cart-item_qty-btn pull-left m-none-top p-half-all-xs" onclick="LS.plusQuantity({{ item.id }}, true)">
										<i class="fa fa-plus ajax-cart-item_qty-btn-icon"></i></button>
						            </button>
							    </div>
							</div>
							<div class="ajax-cart-item_subtotal-col col-subtotal text-right p-half-all ajax-cart-item_item-row font-bold">
								<span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</span>
							</div>
							<button type="button" class="item-delete js-ajax-cart-delete-btn ajax-cart-item_remove-btn m-quarter-top m-quarter-right m-half-left m-quarter-left-xs pull-left" onclick="LS.removeItem({{ item.id }}, true)">&times;</button>
						</div>
					{% else %}
						<div class="overflow-none ajax-cart-item">
							<div class="ajax-cart-item_image-col p-half-top p-half-bottom p-quarter-left p-quarter-right text-center ajax-cart-item_item-row">
								<img src="{{ item.featured_image | product_image_url('original') }}" class="ajax-cart-item_img full-width" />
							</div>
							<div class="ajax-cart-item_desc-col p-half-all ajax-cart-item_item-row full-width text-wrap">
							<a class="ajax-cart-item-link" href="{{ item.url }}">{{ item.name }}</a><br/>
							    {{ item.unit_price | money }}<br/>
							    x {{ item.quantity }}
							</div>
							<div class="ajax-cart-item_subtotal-col text-right p-half-all ajax-cart-item_item-row">
							{{ item.subtotal | money }}
							</div>
						</div>
					{% endif %}
				{% endfor %}
			{% endif %}
		</div>
		<div class="emptyCart js-empty-ajax-cart centered st alert" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
			{{ "El carrito de compras está vacío." | translate }}
		</div>
		<div class="ajax-cart-total subtotal-price overflow-none p-half-top text-right js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
		  <h3 class="m-none p-quarter-right d-inline-block">{{ "Subtotal" | translate }}:</h3>
		  <h3 id="cart-table-total" class="m-none d-inline-block text-primary" {% if store.editable_ajax_cart_enabled %}data-priceraw="{{ cart.total }}"{% endif %}>{{ cart.total | money }}</h3>
		</div>
		<div id="ajax-cart-shipping" class="ajax-cart-shipping m-bottom p-bottom js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
			{% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
		</div>
		<div id="ajax-cart-totalwshipping" class="total-price full-width text-right text-center-xs m-half-top js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
			{{ "Total" | translate }}:{{ cart.total | money }}
		</div>
		<div class="full-width pull-left ajax-cart-bottom m-top js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
			{% if store.editable_ajax_cart_enabled %}
				<div id="error-ajax-stock" style="display:none;">
				    <div class='alert alert-warning alert-dismissible fade in' role='alert'>
			    	<button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
		                <span aria-hidden='true'>×</span>
		            </button>
				    <strong>{{ 'Error' | translate }}</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
				    </div>
				</div>
			{% endif %}
			{% set cart_total = (settings.cart_minimum_value * 100) %}
			{% if not store.editable_ajax_cart_enabled %}
				<div class="ajax-cart_edit-cart-container text-left pull-left text-center-xs">
					<a href="{{ store.cart_url }}" class="btn btn-link m-half-top m-bottom-xs p-left-none p-right-none">{{ 'Editar carrito' | translate }}</a>
				</div>
			{% endif %}
			<div class="pull-right ajax-cart_finish-buy-container" {{ cart.total < cart_total ? 'style="display:none"' }} id="ajax-cart-submit-div">

					<input class="button pull-right ajax-cart_finish-buy-btn" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
			</div>
			<div class="clear-both p-half-top" {{ cart.total >= cart_total ? 'style="display:none"' }} id="ajax-cart-minumum-div">
				<div class="alert alert-warning" role="alert">
			  	<h4 class="text-center">{{ "El monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}</h4>
				</div>
			</div>
			<input type="hidden" id="ajax-cart-minimum-value" value="{{ cart_total }}"/>
		</div>
	</form>
</div>
<div id="ajax-cart-backdrop" class="js-toggleCart" style="display: none;"></div>