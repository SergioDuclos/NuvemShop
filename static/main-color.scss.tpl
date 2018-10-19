$base-text-color: {{ settings.text_color }};

#shoppingCartPage .cart-contents .productrow {
    border-bottom: 1px solid;
    border-color: rgba($base-text-color, .2 );
}

#shoppingCartPage .cart-contents .firstrow {
    border-bottom: 1px solid $base-text-color;
}

.totals-container {
    border-bottom: 1px solid rgba($base-text-color, .7 );
    background: rgba({{ settings.text_color }}, .05 );
}
.mobile-totals-container{
    background:none;
    border-bottom:0;
}

/* FILTERS & CATEGORIES */
a.category-back {
    color: $base-text-color;
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}