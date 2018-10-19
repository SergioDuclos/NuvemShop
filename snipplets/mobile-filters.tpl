<div class="js-mobile-filters-panel mobile-filters mobile-right-panel animation-panel-right-close visible-phone">
    <a class="js-toggle-mobile-filters mobile-right-panel_header mobile-right-panel_header-dark" href="#">
        <i class="fa fa-arrow-left mobile-right-panel_arrow-left mobile-right-panel_arrow-left-big"></i>
        <span class="mobile-right-panel_header-text mobile-right-panel_header-text-big">{{ 'Filtrar por:' | translate }}</span>
    </a>
    <div class="p-left p-right">
        {% snipplet "filters.tpl" %}
    </div>
</div>
