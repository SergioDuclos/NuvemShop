<div id="store-curr" class="hidden">{{ cart.currency }}</div>
<div class="subtotal-price hidden" data-priceraw="{{ cart.total }}"></div>
<div id="ajax-cart" class="cart-summary">
    <i class="fa fa-shopping-cart"></i>
    <a href="#" class="js-toggleCart">
    <span>{{ "Carrito" | translate }}</span>
    (<span id="cart-amount">{{ "{1}" | translate(cart.items_count ) }}</span>) 
    <span id="cart-total">{{ cart.total | money }}</span></a>
</div>
