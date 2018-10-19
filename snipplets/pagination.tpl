{% if pages.numbers %}
	{% if pages.previous %}
        <a href="{{ pages.previous }}" class="mobile-pagination_arrow-link nobutton">
        	<span class="mobile-pagination_arrow mobile-pagination_arrow-previous visible-phone">
				<i class="fa fa-chevron-left"></i>
			</span>
			<span class="hidden-phone"><</span>
        </a>
    {% endif %}
    {% for page in pages.numbers %}
	 	{% if page.selected %}
	 	<div class="js-page-link-{{ page.number }} mobile-pagination_input-container d-inline-block {% if not pages.previous %}mobile-pagination_input-container-wider{% endif %}">
	 		<span class="page-number selected hidden-phone">{{ page.number }}</span>
	 		<span class="visible-phone mobile-pagination_page-reference m-quarter-right"> 
				{{ 'Página' | t }}
			</span> 
 			<input type="number" value="{{ page.number }}" class="js-mobile-paginator-input mobile-pagination_input form-control visible-phone text-center"/> 
 			<span class="visible-phone mobile-pagination_page-reference m-quarter-left"> 
				{{ 'de ' | t }} {{ pages.amount }}
			</span> 
		</div>
	 	{% else %}
	 		<a href="{{ page.url }}" class="js-page-link-{{ page.number }} hidden-phone">{{ page.number }}</a>
	 	{% endif %}
	{% endfor %}
	{% if pages.next %}
		<a href="{{ pages.next }}" class="mobile-pagination_arrow-link">
			<span class="mobile-pagination_arrow mobile-pagination_arrow-next visible-phone">
				<i class="fa fa-chevron-right"></i>
			</span>
			<span class="hidden-phone">&gt;</span>
		</a>
	{% endif %}
{% endif %}