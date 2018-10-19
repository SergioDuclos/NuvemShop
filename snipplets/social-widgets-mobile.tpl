{# Mobile Sharing #}
<div class="social-widgets-mobile text-center p-half-top p-half-bottom clear visible-phone">
	<h4 class="social-widgets-mobile_title p-quarter-top p-half-bottom font-weight-normal">{{ "Compartir" | translate }}:</h4>
	<!-- Whatsapp button -->
	<a class="js-mobile-social-share social-widgets-mobile_btn social-widgets-mobile_btn_whatsapp product-share-button btn-circle no-link bg-whatsapp d-inline-block m-half-all" data-network="whatsapp" target="_blank"
	 href="whatsapp://send?text={{ product.social_url }}">
		<i class="fa fa-whatsapp"></i>
	</a>
	<!-- Facebook button -->
	<a class="js-mobile-social-share social-widgets-mobile_btn social-widgets-mobile_btn_facebook product-share-button btn-circle no-link bg-facebook d-inline-block m-half-all" data-network="facebook" target="_blank"
	 href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
	 title="Share on Facebook">
		<i class="fa fa-facebook"></i>
	</a>
	<!-- Twitter button -->
	<a class="js-mobile-social-share social-widgets-mobile_btn social-widgets-mobile_btn_twitter product-share-button btn-circle no-link bg-twitter d-inline-block m-half-all" data-network="twitter" target="_blank"
	 href="https://twitter.com/share?url={{ product.social_url }}"
	 title="Share on Twitter">
		<i class="fa fa-twitter"></i>
	</a>
	<!--Google+ button -->
	<a class="js-mobile-social-share social-widgets-mobile_btn social-widgets-mobile_btn_googleplus product-share-button btn-circle no-link bg-google d-inline-block m-half-all" data-network="gplus" target="_blank"
	 href="https://plus.google.com/share?url={{ product.social_url }}"
	 title="Share on Google+">
		<i class="fa fa-google-plus"></i>
	</a>
 	<a class="js-mobile-social-share social-widgets-mobile_btn social-widgets-mobile_btn-branded product-share-button social-widgets-mobile_btn_pinterest btn-circle no-link bg-pinterest c-pointer d-inline-block m-half-all" target="_blank" data-network="pinterest">
		<i class="fa fa-pinterest"></i>
 	</a>
</div>