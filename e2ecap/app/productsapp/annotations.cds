using MyService as service from '../../srv/MyService';

annotate service.ProductSet with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ProductID',
            Value : ProductID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ProductName',
            Value : ProductName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SupplierID',
            Value : SupplierID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CategoryID',
            Value : CategoryID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'QuantityPerUnit',
            Value : QuantityPerUnit,
        },
    ]
);
annotate service.ProductSet with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ProductID',
                Value : ProductID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ProductName',
                Value : ProductName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SupplierID',
                Value : SupplierID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CategoryID',
                Value : CategoryID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'QuantityPerUnit',
                Value : QuantityPerUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'UnitPrice',
                Value : UnitPrice,
            },
            {
                $Type : 'UI.DataField',
                Label : 'UnitsInStock',
                Value : UnitsInStock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'UnitsOnOrder',
                Value : UnitsOnOrder,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ReorderLevel',
                Value : ReorderLevel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Discontinued',
                Value : Discontinued,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
