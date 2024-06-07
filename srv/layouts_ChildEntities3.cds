using service1 as service from './service';

/**
    UI.LineItem
 */
annotate service1.ChildEntities3 with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : field,
        },
    ],
);