{% if not settings.image_borders %}
.dest-gral,
.dest-gral:hover,
.dest-gral .bajada:hover,
.dest-gral:hover .bajada,
#product-listing .product,
#product-listing .product .bajada,
#shoppingCartPage .cart-contents .productrow .col-image img,
#single-product .productContainer .imagecol .imagecolContent,
#single-product .thumbnail-container .single-thumb,
#single-product .productContainer .imagecol .shareDiv{
    border-color:transparent;
}

.dest-gral:hover,
.product:hover .head{
    border-color:#d2d2d2;
}
{% endif %}

body{
    background-color: {{ settings.background_color }};
{% if "default-background.jpg" | has_custom_image %}
    background-image: url( "{{ "default-background.jpg" | static_url }}" );
{% endif %}
}

#shoppingCartPage .cart-contents .productrow {
    border-bottom: 1px solid;
    border-color: rgba({{ settings.text_color }}, .2 );
}
#shoppingCartPage .cart-contents .firstrow {
    border-bottom: 1px solid {{ settings.text_color }};
}
.totals-container {
    border-bottom: 1px solid rgba({{ settings.text_color }}, .7 );
    background: rgba({{ settings.text_color }}, .05 );
}
.mobile-totals-container{
    background:none;
    border-bottom:0;
}
.home-slider_placeholder-container,
.product-slider_placeholder-container{
    background-color:rgba({{ settings.text_color }}, 0.05);
}
.product-slider-placeholder_svg-icon{
    fill:rgba({{ settings.text_color }}, 0.07);
}
.placeholder-color{
    background-color:rgba({{ settings.text_color }}, 0.07);
}
.svg_loading-icon{
    fill:{{ settings.button_secondary_bg }};
}
/* FILTERS & CATEGORIES */
a.category-back {
    color: {{ settings.text_color }};
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}
.filter-btn{
    color: {{ settings.text_color }};
}


.cloud-zoom-big {
    background-color: {{ settings.background_color }};
}

#fancybox-wrap {
    background-color: {{ settings.background_color }};
}

#no-logo,
#auth a,
#header .infobox,
#header .infobox a,
#footer,
#footer a{
    color: {{ settings.footer_text }};
}
#no-logo {
    text-transform: capitalize;
    font-weight: bold;
    
}
.sf-menu a, .sf-menu a:visited{
    color: {{ settings.nav_text }};
}

.sf-menu li:hover, .sf-menu li.sfHover,
.sf-menu a:focus, .sf-menu a:hover, .sf-menu a:active{
    color: {{ settings.nav_text_hover }};
}

.sf-menu li.selected a{
    color: {{ settings.nav_text_hover }};
    border-top: 1px solid {{ settings.nav_text_hover }};
    border-bottom: 1px solid {{ settings.nav_text_hover }};
}

.button:hover, .submit_button:hover, #ls_cart_widget .cart-summary:hover, .button:hover, .submit_button:hover, #newsletter input.btn:hover, button#calculate-shipping-button:hover, .button.continue-buying:hover, .submit_button.contact:hover, .btn:hover, input.btn.news:hover {
    opacity: 0.8;
}
#newsModal{
   background-color: {{ settings.background_color }};  
}
#navigation,
.sf-menu li{
    background-color: {{ settings.nav_background }};
}

#navigation{
    border-top: 1px solid {{ settings.nav_border }};
    border-bottom: 1px solid {{ settings.nav_border }};
}

.sf-menu ul{
    border: 1px solid {{ settings.nav_border }};
    background-color:{{ settings.nav_background }};
}

.sf-menu li.selected ul li a{
    color: {{ settings.nav_text }};
}

.sf-menu li.selected ul li a:hover {
    color: {{ settings.nav_text_hover }};
}



#ls_cart_widget .cart-summary, .button, .submit_button, #newsletter input.btn, #newsletter-popup input.btn.news, button#calculate-shipping-button, .button.continue-buying, .submit_button.contact, .contact_form .submit_button, .contact_form .field input.submit_button, addresses a, .password-password .btn{
    background-color: {{ settings.button_secondary_bg }};
    background: {{ settings.button_secondary_bg }};
    color: {{ settings.button_color}};
    font-family:{{ settings.font_buttons | raw }};
}

.see-installments-button {
    color: {{ settings.text_color }};
    background: none!important;
    text-decoration: underline;
}

.button:hover, .submit_button:hover {
    opacity: 0.9;
}

#wrapper-foot,
.dest-gral .head .offer,
.dest-gral .head .out-of-stock,
.dest-gral .head .product-details-overlay,
#newsletter input[type="news"], #newsletter input[type="text"], .password-password input[type="password"]{
    background-color: {{ settings.footer_bg }};
}
#newsletter input[type="news"], #newsletter input[type="text"] ,.password-password input[type="password"] {
    border: 1px solid {{ settings.actual_footer_text }};
    color: {{ settings.actual_footer_text }};
}
#wrapper-foot {
    color: {{ settings.actual_footer_text }};
}
.product-details-overlay span:hover {
    color: {{ settings.actual_footer_text }};
}
.button,
.submit_button,
.dest-gral .head .free-shipping {
    background-color: {{ settings.button_bg }};
}
.secondary-button{
    background-color: {{ settings.button_secondary_bg }};
}
.headerBox{
    color: {{ settings.title_color }};
    background-color: {{ settings.title_background }};
    border-color: {{ settings.content_border }};
}

.headerBox h2, 
.headerBox-Page h2, 
.headerBox-List h2,
.headerBox h1, 
.headerBox-Page h1, 
.headerBox-List h1{
    color: {{ settings.title_color }};
    font-family: {{ settings.font_headings | raw }}!important;
}
.featured-products-header{
    font-family: {{ settings.font_headings | raw }}!important;
}
.headerBox-List span {
    color: {{ settings.text_color }};
}

/* password page */
.password-page .password-container.password-message h2{
    color: {{ settings.title_color }};
    font-family: {{ settings.font_headings | raw }};
}
.password-container.password-message{
    border-top: 1px solid {{ settings.nav_border }};
    border-bottom: 1px solid {{ settings.nav_border }};
}
.password-password{
    border-bottom: 1px solid {{ settings.nav_border }};
}
.sf-menu a, .col-foot a {
    font-family: {{ settings.font_navigation | raw }}!important;
}
.password-page .password-container.password-social a.soc-foot i{
    color: {{ settings.title_color }};
}
.password-page .password-container #wrapper-foot ul.foot-nav li a{
    color: {{ settings.actual_footer_text }};
}
#wrapper-foot h4,
.col-foot li.phone,
.col-foot li.mail,
.col-foot li.mail a,
.col-foot li.address,
.col-foot li.blog,
.col-foot li.blog a,
.col-foot li a, 
#wrapper-foot i.fa {
    color: {{ settings.actual_footer_text }};
}

button, select, textarea {
    font-family: {{ settings.font_buttons | raw }}!important;
}

body, .dest-gral .bajada .title, .dest-gral .bajada .title a, .dest-gral .bajada .price, .cart-contents .name, .contact, .contact a, .contact_form .field label, .user-content a.quick, .social-title h1, a, .product-details-overlay span:hover, .product-details-overlay span {
    color: {{ settings.text_color }};
    font-family: {{ settings.font_rest | raw }};
}
.button.contact{
    color: {{ settings.button_color}};
}
.dest-gral .bajada .title a, .dest-gral .bajada .price, .dest-gral .bajada .price-compare span{
    font-family: {{ settings.font_product_title | raw }};
}
.product-details-overlay span:hover, .product-details-overlay span {
    color: {{ settings.actual_footer_text }};
}
a.insta-variations { 
    border: 2px solid rgba({{ settings.text_color }}, 0.2); 
    float: left;
} 
a.insta-variations.selected { 
    border: 2px solid {{ settings.button_secondary_bg }};
}
.fancybox-skin {
     color: {{ settings.text_color }};
     background: {{ settings.background_color }};
}
.badge {
    color: {{ settings.text_color }};
    background: {{ settings.background_color }};
    font-size: 13px;
}
/* Banner Services */

.banner-services,
.mobile-banner-services .bx-wrapper .bx-viewport,
.mobile-banner-services{
    background: {{ settings.background_color }};
}
.banner-services h4{
    font-family: {{ settings.font_headings | raw}};
    color: {{ settings.text_color }};
    font-weight: 500;
}
.banner-services p{
    color: {{ settings.text_color }};
}
.mobile-banner-services .bx-wrapper .bx-pager.bx-default-pager a{
    background: {{ settings.text_color }};
     opacity:0.5;
}
.mobile-banner-services .bx-wrapper .bx-pager.bx-default-pager a.active{
    background: {{ settings.text_color }};
    opacity:1;
}
.banner-services .span4:not(:last-child), .banner-services .span6:not(:last-child){
    border-right: 1px solid;
    border-color:{{ settings.text_color }};
}
.banner-services .banner-service-item .service-icon{
    color: {{ settings.text_color }};
}
.banner-service_svg-icon{
    fill:{{ settings.text_color }};
}
.banner-services-footer{
    background: {{ settings.background_color }};
    border-top: 1px dotted #a0a0a0; 
}
/* Hamburguer nav */
.pushy a:hover{
    background:{{ settings.button_bg }};
    color: {{ settings.button_color}};
    text-decoration:none;
}
i.mobile-sidenav_pages-arrow-icon{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}
.mobile-sidenav_first-row,
.item-with-subitems > .pages-accordion{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}

/*Hamburguer Navigation end*/

@media (max-width: 979px) {
    header {
        background: {{ settings.background_color }};
    }
}
#product_form  #shipping-calculator li input[type="radio"]:checked + .shipping-option .option-name{
    color: {{ settings.title_color }};
}
#product_form  #shipping-calculator li .shipping-option .option-name{
    color: {{ settings.title_color }};
}
 #shipping-calculator li .shipping-option i{
 display:none;
}
#shipping-calculator li input[type="radio"]:checked + .shipping-option { 
    border:2px solid {{ settings.title_color }};
 }
 #shipping-calculator li input[type="radio"]:checked + .shipping-option .option-name{
    color: {{ settings.title_color }};
}
 #shipping-calculator li input[type="radio"]:checked + .shipping-option i{
  display: block;
  float: right;
  font-size: 18px;
  color: {{ settings.title_color }};
  position: absolute;
  right: 10px;
  top: 10px;
}
.shipping-calculator li input[type="radio"]:checked + .shipping-option { 
    border: 2px solid {{ settings.text_color }};
}
#shipping-calculator li input[type="radio"]:checked + .shipping-option img{
  -webkit-filter: initial;
  filter:initial;
}
.product-quantity-desktop-line{
    border-top:1px solid rgba({{ settings.text_color }}, .1);
}
/*** Installments details ***/
.product-detail_installments-module{
    border-bottom: 1px solid rgba({{ settings.text_color }}, 0.1); 
}
.installments_modal {
    background: {{ settings.background_color }};
}
.installments_gateways-tabs-container{
    border-bottom:1px solid rgba({{ settings.text_color }}, .2);
}
.nav-tabs .installments_pill-tab.active .installments_pill-tab-link{
    background-color: {{ settings.button_secondary_bg }};
    color: {{ settings.button_color}};
    border:1px solid rgba({{ settings.text_color }}, .2);
}
.nav-tabs .installments_pill-tab-link,
.nav-tabs .installments_pill-tab-link:hover{
    border:1px solid rgba({{ settings.text_color }}, .2);
}
.nav-tabs .installments_flag-tab.active .installments_flag-tab-link,
.nav-tabs .installments_flag-tab.active .installments_flag-tab-link:focus{
    outline:2px solid {{ settings.button_secondary_bg }};
}
.installments_check-icon,
.installments_selected-gw{
    color: {{ settings.button_secondary_bg }};
}
.installments_check-icon .fa-inverse{
    color:{{ settings.background_color }};
}
.installments-divider{
    border-bottom:1px dotted rgba({{ settings.text_color }}, .2);
}
.installments_credit-bank-container{
    background-color: rgba({{ settings.text_color }}, .06);
}
.installment_price-accent{
    color: {{ settings.button_secondary_bg }};
}
/**** Cart ***/
#ls_cart_widget .cart-summary a, #ls_cart_widget .cart-summary span, #ls_cart_widget .cart-summary i.fa { 
color: {{ settings.button_color}} 
}
button.item-plus i.fa, button.item-minus i.fa, .item-delete {
    color: {{ settings.text_color }};
    opacity: 0.5;
}
button.item-plus i.fa:hover, button.item-minus i.fa:hover, .item-delete:hover {
    color: {{ settings.text_color }};
    opacity: 1;
}
/* AJAX Cart */
a.js-toggleCart {
    text-decoration: none;
    color: {{ settings.button_color}};
}
.btn-link{
    color: {{ settings.text_color}};
}
.btn-link:hover,
.btn-link:focus{
    color: {{ settings.text_color}};
    opacity: 0.6;
}
@media(max-width: 769px){
    /* Search Suggestons */
    .backdrop.mobile-search-backdrop{
        background-color: rgba({{ settings.background_color }}, .9);
    }
    /* Mobile filters */
    a.mobile-filters-btn{
        background-color: rgba({{ settings.text_color }}, .9);
        color: {{ settings.background_color }};
    }
    .mobile-zoom_panel{
        background:{{ settings.background_color }};
    }
    /* Mobile Zoom */
    .mobile-zoom_btn{
        background:{{ settings.background_color }};
    }
    /* Horizontal Mobile categories */
    .mobile-horizontal-categories_link{
        background-color:rgba({{ settings.text_color }}, .1);
    }
    /* Product detail */
    .product-quantity{
        border-top:1px solid rgba({{ settings.text_color }}, .1);
        border-bottom:1px solid rgba({{ settings.text_color }}, .1);
    }
    .product-quantity-mobile-no-line{
        border-top:0;
    }
    /* Installments details */
    .installments_gateways-tabs-container{
        border-bottom:0;
    }
    .installments_gateways-horizontal-container{
        border-bottom:1px solid {{ settings.text_color }};
    }
    .product-detail_installments-module{
        border-top:1px solid rgba({{ settings.text_color }}, .1);
    }
    .product-detail_installments-arrow{
        fill:{{ settings.text_color }};
    }
}

/**** Sidebarhome****/

#categories-column.sidebar-home #show-more-cats i.fa{
    background-color: {{ settings.button_secondary_bg }};
    border:none;
    color: {{ settings.button_color}};
    left:30%;
}

/*** MOBILE HEADER NAV ***/

.mobile-nav{
    background-color:{{ settings.background_color }};  
    border-bottom: 1px solid {{ settings.nav_border }};
}
.mobile-nav_page-title{
    font-family: {{ settings.font_headings | raw }};
}
.mobile-nav_tab-text{
    color: {{ settings.nav_text }};
}
.mobile-nav_tab.mobile-nav_tab-selected{
    border-bottom: 2px solid {{ settings.nav_text_hover }};
}
.mobile-nav_tab.mobile-nav_tab-selected .mobile-nav_tab-text{
    color: {{ settings.nav_text_hover }};
}
.mobile-nav_tab-cart-amount{
    background-color: {{ settings.nav_text_hover }};
    color: {{ settings.nav_background }};
}
.mobile-nav-first-row_svg-icon{
    fill:{{ settings.text_color }};
}
.mobile-nav_second-row{
    background-color: {{ settings.nav_background }};
}
.mobile-nav_main-categories-container{
    background-color: {{ settings.background_color }};
    box-shadow: 2px 0px 1px 1px rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}
.mobile-nav_main-categories-close-btn{
    border:1px solid rgba({{ settings.text_color }}, .3);
}
.mobile-categories-nav-all-link{
    background-color:darken({{ settings.background_color }}, 3%);
}
.mobile-category-dropdown.dropdown-selected .mobile-categories-nav-arrow i{
    transform-origin: center;
    transform: rotate(180deg);
    -webkit-transform: rotate(180deg);
    -moz-transform: rotate(180deg);
    -ms-transform: rotate(180deg);
    -o-transform: rotate(180deg);
    color:{{ settings.button_secondary_bg }};
}
.mobile-category-dropdown.dropdown-selected{
    font-weight: bold;
    color:{{ settings.button_secondary_bg }};
}
.mobile-categories-nav-link{
    border-bottom:1px solid rgba({{ settings.text_color }}, .3);
}
/* Mobile Categories Links */
.mobile-nav_main-categories-container{
    background-color:lighten({{ settings.background_color }}, 3%);
    color: {{ settings.button_color}};
    box-shadow: 2px 0px 1px 1px rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}
.mobile-sidenav_pages-arrow-selected i{
    background: {{ settings.button_secondary_bg }};
}
.mobile-nav_category-list-item-link,
.mobile-nav_all-categories-link{
    color: {{ settings.text_color }};
    border-bottom: 1px solid rgba({{ settings.text_color }}, .3);
}
.mobile-nav_all-categories-link{
    background-color:darken({{ settings.background_color }}, 2%);
}
.mobile-nav_category-list-item-link:hover{
    color: {{ settings.text_color }};
}
.mobile-right-panel{
    background-color:lighten({{ settings.background_color }}, 3%); 
}
.mobile-right-panel_arrow-right,
.mobile-right-panel_arrow-left{
    color: {{ settings.button_secondary_bg }};
}
.mobile-right-panel_header-dark{
    background-color:darken({{ settings.background_color }}, 1%);
    border-bottom: 1px solid darken({{ settings.background_color }}, 3%);
}
.mobile-nav_main-categories-container li a:active,
.mobile-nav_main-categories-container li a:active span, 
.mobile-nav_category-list-item-link:active, 
.mobile-nav_category-list-item-link:active .mobile-right-panel_arrow-right, 
.mobile-nav_main-categories-container a:active .mobile-right-panel_arrow-left,
.mobile-right-panel_header:active,
.mobile-right-panel_header:active .mobile-right-panel_arrow-left{
    background-color:{{ settings.button_secondary_bg }};
    color:{{ settings.background_color }};
}
input.mobile-nav_search-input{
    background-color:{{ settings.background_color }};
}
.mobile-nav_search-icon{
    color: {{ settings.text_color }};   
}

/* Search suggestions */
.search-suggest{
    background-color: {{ settings.background_color }};
}
.search-suggest_link,
i.search-suggest_icon{
    color: rgba({{ settings.text_color }}, 0.8);
}
.search-suggest_product-name strong{
    color: {{ settings.text_color }};
}
.search-suggest_link:hover,
.search-sugget_link:focus{
    color: rgba({{ settings.text_color }}, 0.6);
    background-color: darken({{ settings.background_color }}, 3%);
}
.search-suggest_all-results-link{
    background-color: darken({{ settings.background_color }}, 3%);
}
/****** PROPERTIES HELPERS ******/
.border-left{
    border-left:1px solid rgba({{ settings.text_color }}, .3);
}
.border-top{
    border-top:1px solid rgba({{ settings.text_color }}, .3);
}
.border-right{
    border-right:1px solid rgba({{ settings.text_color }}, .3);
}
.border-bottom{
    border-bottom:1px solid rgba({{ settings.text_color }}, .3);
}

.text-primary {
   color: {{ settings.button_bg }};
 }

/* Ajax Cart Panel Improvements START */

#ajax-cart-details{
    background: {{ settings.background_color }}; 
 }
 .ajax-cart_titles {
    background: {{ settings.title_background }};
 }
.ajax-cart_titles, .ajax-cart-item:last-child { 
    font-family: {{ settings.font_headings | raw }};
    border-top: 1px solid rgba({{ settings.button_secondary_bg }}, 0.2);
    border-bottom: 1px solid rgba({{ settings.button_secondary_bg }}, 0.2);
}
.ajax-cart-item { 
    font-family: {{ settings.font_headings | raw }}; 
    border-bottom: 1px solid rgba({{ settings.button_secondary_bg }}, 0.2); 
    background: rgba(150, 150, 150, 0.06); 
}
.ajax-cart-item:last-child { 
    font-family: {{ settings.font_headings | raw }}; 
    border-top: none; 
    border-bottom: 2px solid rgba({{ settings.button_secondary_bg }}, 0.2) 
}
.ajax-cart-item_qty-container{
    border:1px solid rgba({{ settings.text_color }}, .2);
}
.ajax-cart-item .ajax-cart-item-link { 
    color: {{ settings.button_bg }};
}
.ajax-cart-total { 
    font-family: {{ settings.font_headings | raw }}; 
}
.ajax-cart-shipping{
    border-top: 1px solid rgba({{ settings.button_secondary_bg }}, 0.2);
    border-bottom: 1px solid rgba({{ settings.button_secondary_bg }}, 0.2);
}
/* Ajax Cart Panel Improvements END */

/* Mobile Custom Variants START  */

.mobile-vars_btn {
    border: 1px solid rgba({{ settings.text_color }}, .2);
    border-radius: 0;
    background: {{ settings.title_background }};
}
.mobile-vars-panel {
    background: {{ settings.background_color }};
}
.mobile-vars-panel_item-row {
    border-top: 1px solid rgba({{ settings.button_secondary_bg }}, .4);
}
.mobile-vars-panel_item-icon-container {
    background: rgba({{ settings.button_secondary_bg }}, .4);
}
.mobile-vars-panel_item-row.selected {
    color: {{ settings.background_color }};
    border-right: 0;
    border-left: 0;
    border-bottom: 0;
    background: {{ settings.button_bg }};
}
.mobile-vars-panel_item-row.selected .mobile-vars-panel_item-icon-container {
    background: {{ settings.background_color }};
    color: {{ settings.button_bg }};
}
.mobile-vars-panel_item-row.selected .mobile-vars-panel_item-icon { 
    visibility: visible; 
}
.mobile-vars_selected-label{
    color: {{ settings.button_bg }};
}
.mobile-vars_btn-icon{
    fill:{{ settings.button_bg }};
}

/* Mobile Custom Variants END  */

hr{
    border: 1px solid rgba({{ settings.text_color }}, .1);
    border-bottom:0;
}
