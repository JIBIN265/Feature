using service1 from './service';

annotate service1.RootEntities with @odata.draft.enabled; //Search-Term: #Draft

annotate service1.RootEntityVariants with @odata.draft.enabled; //Annotation has to exists, without no entites would be visible on view with other entity set of List Report 

annotate service1.RootEntities with @(
    //Disables the delete option dependent of the fields value
    Capabilities.DeleteRestrictions : {
        Deletable   : deletePossible, //Search-Term: #DynamicCRUD
    },
    /* Capabilities.UpdateRestrictions : {
        Updatable : updatePossible, //UpdateRestrictions are ignored in determining if the edit button is visible or not, but it still affects wheather the fields are editable or not
    }, */
    UI.UpdateHidden : updateHidden,//Search-Term: #DynamicCRUD

    /* Capabilities.FilterRestrictions : {
        RequiredProperties : [
            stringProperty //Search-Term: #RequiredFilter    
        ],
    }, */
);

annotate service1.ChartDataEntities with @(
    //Search-Term: #ChartSection
    Aggregation.ApplySupported : {
        Transformations          : [
            'aggregate',
            'topcount',
            'bottomcount',
            'identity',
            'concat',
            'groupby',
            'filter',
            'expand',
            'top',
            'skip',
            'orderby',
            'search'
        ],
        Rollup                   : #None,
        PropertyRestrictions     : true,
        GroupableProperties : [
            dimensions,
            criticality_code
        ],
        AggregatableProperties : [
            {Property : integerValue},
        ],
    }
);

annotate service1.ChartDataEntities with {
    //Search-Term: #ChartSection
    criticality @(
        UI.ValueCriticality   : [
            {
                Value       : 0,
                Criticality : #Neutral
            },
            {
                Value       : 1,
                Criticality : #Negative
            },
            {
                Value       : 2,
                Criticality : #Critical
            },
            {
                Value       : 3,
                Criticality : #Positive
            }
        ]
    );

    integerValue @(
        Measures.ISOCurrency : uom_code,
        Core.Immutable       : true,
    );
};