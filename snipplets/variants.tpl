<div class="fancyContainer product">
  <div class="row-fluid">

  <!-- Color and size variants -->
  {% for variation in product.variations if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'] %}
        <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} row-fluid insta-variation-container {% if quickshop %}attributeLine-quickshop m-half-bottom p-quarter-bottom{% else %}attributeLine{% endif %} {% if not quickshop %}m-half-top m-half-bottom{% endif %}">
          <label class="variation-label m-quarter-top text-left-xs {% if quickshop %}pull-left {% endif %}" for="variation_{{loop.index}}">
            {% if quickshop %}
              <div class="number">{{ loop.index }}</div>
              <span>{{variation.name}}:</span>
            {% else %}
              <span>{{variation.name}}: </span>
            {% endif %}
            <strong>{{ product.default_options[variation.id] }}</strong>
          </label>
          <div class="insta-variations_btn-container {% if quickshop %}insta-variations_btn-container-quickshop{% else %}insta-variations_btn-container-product{% endif %} full-width-xs pull-left-xs d-inline-block-xs">
            {% for option in variation.options if option.custom_data %}
                <a data-option="{{ option.id }}" class="insta-variations {{ variation.name }} {% if product.default_options[variation.id] == option.id %}selected{% endif %}">
                  <span style="background: {{ option.custom_data }}" data-name="{{ option.name }}"></span>
                </a>
            {% endfor %}
            {% for option in variation.options if not option.custom_data %}
                <a data-option="{{ option.id }}" class="insta-variations insta-variations_btn-custom {{ variation.name }} {% if product.default_options[variation.id] == option.id %}selected{% endif %}">
                    <span class="custom-variants" data-name="{{ option.name }}">{{ option.name }}</span>
                  </a>
            {% endfor %}
          </div>
        </div>
    {% endfor %}

    <!-- custom variants -->
    {% for variation in product.variations %}
      <div class="js-mobile-variations-container">
          <div class="{% if not quickshop %}span6 m-none-left{% endif %} desktop-product-variation m-half-top hidden-phone" {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}style="display: none"{% endif %}>
              <div class="{% if quickshop %}attributeLine-quickshop{% else %}attributeLine{% endif %}">
                  <label class="variation-label" for="variation_{{loop.index}}">
                    {% if quickshop %}
                      <div class="number">{{ loop.index }}</div>
                      <span>{{variation.name}}:</span>
                    {% else %}
                      <span>{{variation.name}}: </span>
                    {% endif %}
                  </label>
                  <select class="js-variation-option variation-option" name="variation[{{ variation.id }}]"
                  {% if quickshop %}
                      onchange="LS.changeVariant(changeVariant, '#quick{{ product.id }} .productContainer');">
                  {% else %}
                      onchange="LS.changeVariant(changeVariant, '#single-product .productContainer');">
                  {% endif %}
                  {% for option in variation.options %}
                      <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                  {% endfor %}
                  </select>
              </div>
          </div>
        {% if not(variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'])%}
          <div class="js-mobile-vars mobile-vars visible-phone m-top">
            <a href="javascript:void(0)" class="d-block js-mobile-vars-btn mobile-vars_btn btn btn-default p-relative text-left p-half-top p-double-right p-half-bottom p-half-left {% if quickshop %}js-quickshop-vars{% endif %}" id="{{variation.name}}" style="{% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}display:none;{% endif %}">
                <h5 class="m-none font-weight-normal text-wrap">{{variation.name}}:</h5>
                <span class="js-mobile-vars_selected-label mobile-vars_selected-label text-wrap ">{{ product.default_options[variation.id] }}</span>
                <div class="mobile-vars_btn-icon">
                  <svg baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="598 -476.1 1792 1792"><path d="M1769 483.9c0 8.7-3.3 16.3-10 23l-466 466c-6.7 6.7-14.3 10-23 10s-16.3-3.3-23-10l-50-50c-6.7-6.7-10-14.3-10-23s3.3-16.3 10-23l393-393-393-393c-6.7-6.7-10-14.3-10-23s3.3-16.3 10-23l50-50c6.7-6.7 14.3-10 23-10s16.3 3.3 23 10l466 466c6.7 6.7 10 14.3 10 23z"/></svg>
                </div>  
            </a>
            <div class="js-mobile-vars-panel mobile-right-panel mobile-vars-panel animation-panel-right-close" data-custom="{{variation.name}}" style="{% if quickshop %}top: 60px;{% endif %}{% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}display:none;{% endif %}">
              <a class="js-close-panel mobile-right-panel_header d-block text-left p-all">
                <i class="fa fa-arrow-left mobile-right-panel_arrow-left"></i>
                    <span class="mobile-right-panel_header-text">{{variation.name}}</span>
              </a>
              {% for option in variation.options %}
              <a href="javascript:void(0)" class="js-mobile-vars-property mobile-vars-panel_item-row text-foreground p-all {% if quickshop %}js-quickshop-mobile-vars-property{% endif %}" data-option="{{ option.id }}">
                <div class="row">
                  <div class="mobile-vars-panel_check">
                  <span class="m-half-right mobile-vars-panel_item-icon-container">
                    <i class="mobile-vars-panel_item-icon fa fa-check text-primary" aria-hidden="true"></i>
                  </span>
                  </div>
                  <div class="mobile-vars-panel_variant-name p-left-none text-wrap">
                  {{ option.name }}
                  </div>
                </div>
              </a>
              {% endfor %}
            </div>
          </div>
        {% endif %}
      </div>
    {% endfor %}
  </div>
</div>
