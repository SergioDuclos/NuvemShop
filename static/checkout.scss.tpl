{% if store.allows_checkout_styling %}
{# You should keep all settings in SASS variables for reuse #}
{# Color Variables #}
$accent-brand-color: {{ settings.button_bg | default('rgb(77, 190, 207)' | raw ) }};
$foreground-color: {{ settings.text_color | default('rgb(77, 190, 207)' | raw ) }};
$background-color: {{ settings.background_color | default('rgb(77, 190, 207)' | raw ) }};

{# Font Family #}
$heading-font: {{ settings.font_headings | default('Open Sans Condensed') | raw }};
$body-font: {{ settings.font_rest | default('Open Sans Condensed') | raw }};

body {
  font-family: $body-font;
  font-weight: 100;
  background-color: $background-color;
}
strong { 
  font-weight: 400; 
}
.main-container {
  background-color: $background-color;
}
.header { 
  background-color: lighten($background-color, 10%);
  border-bottom: 2px solid $accent-brand-color;
}
.form-box {
  border-radius: 0;
  border: none;
  padding: 10px 20px 20px 20px;
  background: lighten($background-color, 10%);
  border: 1px solid darken($background-color, 10%);
}
.form-box h1 {
  font-family: $heading-font;
  color: $foreground-color;
  text-shadow: none;
  border-bottom: 1px solid darken($background-color, 10%);
  font-weight: bold;
}
.form-control {
  background: lighten($accent-brand-color, 100%);
}
.form-control:focus, select:focus, textarea:focus {
  border-color: $accent-brand-color !important;
  outline: none;
}

input[type=submit], button[type=submit] {
  font-family: $heading-font;
  text-transform: uppercase;
  border-radius: 0;
  background-color: $accent-brand-color;
}
.login-btn a, .login-btn a:hover {
  color: $accent-brand-color;
}


input[type=submit]:hover, input[type=submit]:focus, input[type=submit]:active, input[type=submit]:active:hover, button[type=submit]:hover, button[type=submit]:focus, button[type=submit]:active, button[type=submit]:active:hover, .ticket-container .ticket-txt a:hover, .ladda-button:active, .ladda-button[disabled], .ladda-button[disabled]:hover {
  background-color: $accent-brand-color;
  text-decoration: none;
  opacity: 0.9;
}

#breadcrumb{
  list-style:none;
  display: inline-block;
  padding: 0;
  margin: 0 0 10px 0;
  
  li{
    float:left;
    a{
      color:lighten($foreground-color, 100%);
      display:block;
      background: $accent-brand-color;
      text-decoration: none;
      position:relative;
      height: 30px;
      line-height:30px;
      padding: 0 10px 0 5px;
      text-align: center;
      margin-right: 23px;
    }
    &:first-child{
      a{
        padding-left:15px;
        border-radius: 0;
        &:before{
          border:none;
         }
      }
      a.inactive:before{
        border-width: 0;
      }
      a.inactive:after{
        border-left-color: rgba($accent-brand-color, 0.3);
      }
    }

    &:last-child{
      a{
        padding-right:15px;
        border-radius: 0;
        &:after{
          border:none;
        }
      }
    }
    
    a{   
      &:before,
      &:after{
        content: "";
        position:absolute;
        top: 0;
        border:0 solid $accent-brand-color;
        border-width:15px 10px;
        width: 0;
        height: 0;
      }
      &:before{
        left:-20px;
        border-left-color:transparent;
      }
      &:after{
        left:100%;
        border-color:transparent;
        border-left-color:$accent-brand-color;
      }
      &:hover{
        opacity: 0.8;
        
        &:before{
          border-left-color:transparent;
         }
      }
      &:active{
        background-color: $accent-brand-color;
        
        &:before{
          border-color:$accent-brand-color;
          border-left-color:transparent;
         }
        &:after{
          border-left-color:$accent-brand-color;
        }
      }
    }
    a.previous {
        opacity: 0.6;
      &:hover{
        opacity: 1;
      }
    }
    a.inactive {
      background: rgba($accent-brand-color, 0.3);
      cursor: default;
      color: darken($accent-brand-color, 40%);
      &:before {
        content: "";
        position:absolute;
        top: 0;
        border:0 solid rgba($accent-brand-color, 0.3);
        border-width:15px 10px;
        width: 0;
        height: 0;
      }
      &:hover{
        opacity: 1;
      }
      &:before{
        left:-20px;
        border-left-color:transparent;
      }
      &:active{
        background-color: rgba($accent-brand-color, 0.3);
        
        &:before{
          border-color:rgba($accent-brand-color, 0.3);
          border-left-color:transparent;
         }
      }
    }
  }
}

div.help {
  background-color: $accent-brand-color;
  color: lighten($foreground-color, 100%);
  border-radius: 0;
}
.custom-checkbox > .box > .tick {
  border-bottom-color: $accent-brand-color;
  border-left-color: $accent-brand-color;
}
.customOption input:checked + label {
  border-color: $accent-brand-color;
}
.customOption input:checked + label span.custom-radio {
  background: $accent-brand-color;
}
.customOption.pickup label {
  border-color: rgba($accent-brand-color, 0.3);
}
.customOption input:checked + label .description .name {
  color: $accent-brand-color;
}

.thankyou .success-msg a {
  color: $accent-brand-color;
}
.thankyou .success-msg .title h1, .thankyou .success-msg h3, .thankyou .form-box .create-account span.label-email {
  font-family: $heading-font;
}

h5 {
  color: $foreground-color;
}
.form-control, select {
  border-color: rgba($accent-brand-color, 0.3);
  border-radius: 0;
}
.table::-webkit-scrollbar-thumb {
  background-color: $accent-brand-color;
}
.table-striped > tbody > tr:first-child {
  border-top: none;
}
.table-striped > tbody > tr:nth-of-type(odd) {
  border-top: 1px dotted rgba($accent-brand-color, 0.03);
  background: rgba($foreground-color, 0.02);
}
.table-striped > tbody > tr:nth-of-type(even) {
  border-top: 1px dotted rgba($accent-brand-color, 0.1);
  background: rgba($foreground-color, 0.01);
}
.header .header-container {
  padding-left: 0;
  padding-right: 8px;
}
.header .header-container div {
  padding: 0;
}
.header .header-container .store-name {
  padding-left: 0;
  text-align: left;
}
.header .header-container .store-name img {
  padding-top: 5px;
}
.summary-container .summary #total-box .table {
  border-radius: 0;
}
.summary-container .summary .table td {
  color: $foreground-color;
}
.summary-container .summary #total-box .table.total-table {
  border-radius: 0;
}
.summary-container .summary #total-box .table.total-table tr td {
  color: $accent-brand-color;
}
.summary-container .summary .slidingDiv {
  background-color: lighten($background-color, 10%);
  border-radius: 0;
  border: 1px solid darken($background-color, 10%);
}
.summary-container .summary #total-box .table td img {
  border-radius: 0;
} 
.summary-container .summary #total-box .table tbody.total {
  border-color: $accent-brand-color;
}
.summary-container .summary #total-box .table .success {
  border-color: $accent-brand-color;
}
.summary-container .summary #total-box .table tbody.total tr { 
  background: $background-color;
}
.summary-container .summary .show-cart-button .fa-circle, .summary-container .summary .show-cart-button .show-details {
  color: $accent-brand-color;
}
.summary-container .summary .show-cart-button span.total-cart {
  margin-top: 2px;
  background-color: $accent-brand-color;
}
.summary-container .summary #coupon-form .coupon-field button {
  background: $accent-brand-color;
  border: 1px solid $accent-brand-color;
}
.summary-container .summary #total-box .table tbody.total tr.discount {
  background-color: rgba($accent-brand-color, 0.1);
  color: $accent-brand-color;
}
.summary-container .summary #total-box .table .success td {
  color: $foreground-color;
  background-color: $accent-brand-color;
}
.summary-container .summary #total-box .table.total-table tr.success td {
  color: lighten($background-color, 10%);
  font-weight: bold;
}

.error-msg-single, .bg-danger, .bg-success, label.same-address, .form-box textarea, div.customOption label, .customOption input:checked + label {
  border-radius: 0;
}
.text-muted {
  color: rgba($foreground-color, 0.6);
}
.seals {
  border-color: rgba($accent-brand-color, 0.3);
}
.ticket-container .ticket-txt a, .custom-container .ticket-txt a {
  font-family: $heading-font;
  text-transform: uppercase;
  border-radius: 0;
  background-color: $accent-brand-color;
}

.card-info-container #cvv-help, .card-info-container div.cvv-helper {
  background-color: $accent-brand-color;
}
.card-info-container #cvv-help.pressed {
  background-color: rgba($accent-brand-color, 0.6);
}
.card-info-container div.cvv-helper .help-container p {
  font-family: $heading-font;
  color: $accent-brand-color;
}
.card-info-container div.cvv-helper .arrow-up {
  border-bottom-color: $accent-brand-color;
}
.ac-container {
  border-color: rgba($accent-brand-color, 0.1);
}
.ac-container label.accordion {
  font-family: $heading-font;
  color: $foreground-color;
  text-shadow: none;
  border-bottom-color: rgba($accent-brand-color, 0.1);
  background: rgba($background-color, 0.3);
}
.ac-container label.accordion:hover {
  background: rgba($background-color, 0.02);
}
.ac-container input.accordion:checked + label span {
  background: $accent-brand-color;
}
.ac-container, .summary-container .summary .show-cart-button span.total-cart {
  font-family: $heading-font;
  border-radius: 0;
}
.ac-container article {
  box-shadow: 0px 3px 0px 0px $accent-brand-color inset;
  background-color: rgba($background-color, 0.8);
}
.ac-container div:first-child label.accordion {
  border-radius: 0;
}
.ac-container div:last-child label.accordion {
  border-radius: 0;
}
.ac-container input.accordion:checked + label.accordion, 
.ac-container input.accordion:checked + label.accordion:hover
 {
  background-color: $accent-brand-color;
  text-shadow: none;
  color: lighten($background-color, 10%);
}
.ac-container input.accordion:checked ~ article {
  background: rgba($foreground-color, 0.02);
  box-shadow: none;
}
.ac-container div:last-child input.accordion:checked + label.accordion {
    border-radius: 0;
    border-bottom: 1px solid rgba($accent-brand-color, 0.1);
}
.ac-container label.accordion p {
  margin: 6px 0 5px 0;
}
.ac-container label.accordion p.tag-discount {
  color: lighten($background-color, 10%);
  background-color: $accent-brand-color;
  border-radius: 0;
}
.ac-container input.accordion:checked + label.accordion p.tag-discount {
  color: $accent-brand-color;
  background-color: lighten($background-color, 10%);
}
div.customOption p.name { 
  font-weight: 400; 
}

.thankyou .form-box {
  overflow: hidden;
}
.thankyou .form-box .create-account {
  padding: 10px 20px 20px 20px;
  color: lighten($background-color, 70%);
  background: rgba($foreground-color, 0.05);
  border-radius: 0;
  border: none;
}
.thankyou .form-box p {
  padding: 25px 0;
  margin-bottom: 20px;
  border-bottom: 1px solid $background-color;
}
.thankyou .form-box .create-account p {
  padding: 0;
  margin: 0;
  color: $foreground-color;
  border-bottom: none;
  font-weight: 100;
}
.create-account .label-email {
  font-weight: 400;
  color: $foreground-color;
  letter-spacing: 1px;
}
.thankyou .form-box .ticket-container {
  margin: 0 0 10px 0;
}
.form-password .btn-submit {
  float: none;
  margin-top: 4px;
  display: inline-block;
}
ul.list-unstyled {
  width: 145px;
  float: right;
}
.safe-box {
  overflow: hidden;
}
.safe-box img {
  max-width: 36px;
}
.safe-box p {
  width: 105px;
  text-align: left;
  float: right;
  padding: 2px 10px 0 4px;
  margin: 0;
  font-family: "Open sans", sans-serif;
  font-size: 11px;
}

@media (min-width: 768px) {
  .form-password {
      margin: 0 auto;
      text-align: center;
      width: 50%;
  }
  .thankyou .form-box .ticket-txt p {
    text-align: left;
  }
  input[type=submit], button[type=submit] {
    width: auto;
    padding: 11px 10px;
    font-size: 20px;
  }
}
@media (min-width: 992px) {
  .thankyou .success-msg {
      width: 66%;
  }
}
{%  endif %}