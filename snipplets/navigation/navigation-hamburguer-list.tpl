{% for item in navigation %}
    {% if not item.isRootCategory and not item.isHomePage  %}
	    {% if item.subitems %}
	    	<li class="item-with-subitems p-relative">
	    		<div class="js-mobile-sidenav-pages-link-container mobile-sidenav_pages-link-container">
		            <a class="d-block clear-both text-decoration-none text-wrap no-link p-double-right" href="{{ item.url }}">
		                {{ item.name }}
		            </a>
		             <span class="text-center  mobile-sidenav_pages-arrow js-toggle-page-accordion c-pointer p-quarter-all p-absolute"><i class="fa fa-chevron-down p-half-all mobile-sidenav_pages-arrow-icon"></i></span> 
		         </div>
 				<ul class="d-none pages-accordion subpages-container p-none">
					{% snipplet "navigation/navigation-hamburguer-list.tpl" with navigation = item.subitems %}
				</ul>
			</li>
		{% else %}
			 <li>
	            <a class="d-block clear-both text-decoration-none text-wrap no-link" href="{{ item.url }}">
	                {{ item.name }}</a>
	         </li>
		{% endif %}
    {% endif %}
{% endfor %}
