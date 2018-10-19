{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<div class="row-fluid" id="404">
    <div class="container">
        <div class="headerBox-Error">
            <h1>- {{ "Error" | translate }} -</h1>
            <h2>{{ "404" | translate }}</h2>
            <p>{{ "La página que estás buscando no existe." | translate }}</p>
        </div>

        {% set primary_section_products %}
            {% for product in sections.primary.products %}
                {% include 'snipplets/single_product.tpl' %}
            {% endfor %}
        {% endset %}

        {% if sections.primary.products %}
        <div class="dest-list visible-when-content-ready">
            <h2>{{ "Quizás te interesen los siguientes productos." | translate }}</h2>
                <div class="row-fluid product-grid"> 
			        {% snipplet "product_grid.tpl" with 'products' = sections.primary.products %}
				</div> 
        </div>
        {% endif %}
    </div>
</div>
{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
    <div class="row-fluid" id="product-example">
        {% snipplet 'defaults/show_help_product.tpl' %}
    </div>
{% endif %}


