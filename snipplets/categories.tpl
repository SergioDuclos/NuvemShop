<div id="categories-column">
    <div id="get-filters" style="display: none;">
        <h4 class="hidden-phone">{{ 'Filtrar por:' | translate }}</h4>
        <h4 class="visible-phone m-top-xs m-quarter-bottom-xs">{{ 'Filtro aplicado:' | translate }}</h4>
    </div>
    <script>
        LS.ready.then(function() {
            LS.showWhiteListedFilters("{{ filters|json_encode() }}");
        });
    </script>

    {% if parent_category and parent_category.id!=0 %}
        <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back hidden-phone"><i class="fa fa-chevron-left"></i>{{ parent_category.name }}</a>
    {% endif %}

    {% if filter_categories %}
        <div class="hidden-phone">
            <h4>{{ category.id!=0 ? category.name :("Categorías" | translate) }}</h4>
            <ul id="categories-list">
                {% for category in filter_categories %}
                    <li data-item="{{ loop.index }}"><a href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a></li>
                {% endfor %}
            </ul>
            <a href="#" id="show-more-cats" style="display: none;" title="{{ 'Mostrar más categorías' | translate }}"><i class="fa fa-angle-down"></i></a>
        </div>
    {% endif %}

</div>
<script>
LS.ready.then(function() {
    var categoriesList = $("#categories-list li");

    if (categoriesList.length > 5) {
        $("#show-more-cats").show();
        for (i = 5; i < categoriesList.length; i++) {
            $(categoriesList[i]).hide();
        }
    }

    $("#show-more-cats").click(function(e){
        e.preventDefault();
        for (i = 5; i < categoriesList.length; i++) {
            $(categoriesList[i]).toggle();
        }
        $(this).find("i").toggleClass("fa-angle-up fa-angle-down");
    });
});
</script>