using {CatalogService} from '../../srv/CatalogService';

annotate CatalogService.PurchaseOrderItems with @(UI : {
    LineItem #poitems : [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.PRODUCT_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        }
    ],
    HeaderInfo        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'PO Item',
        TypeNamePlural : 'PO Items',
        Title          : {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS

        },
        Description    : {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.PRODUCT_ID,
        },
    },

    FieldGroup #Fg1   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.WEIGHT_MEASURE,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.HEIGHT,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.SUPPLIER_GUID.COMPANY_NAME
            }
        ],
    },

    Facets            : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Fg1'
    }, ],

}, );


annotate CatalogService.POs with @(UI : {
    SelectionFields            : [
        PO_ID,
        GROSS_AMOUNT,
        LIFECYCLE_STATUS,
        CURRENCY_code,
        PARTNER_GUID_NODE_KEY
    ],

    LineItem                   : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type       : 'UI.DataField',
            Value       : OVERALL_STATUS1,
            Criticality : Criticality


        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        }
    ],

    HeaderInfo                 : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title          : {
            $Type : 'UI.DataField',
            Value : PO_ID,
            Label : 'Puchase Order',
        },
        Description    : {
            $Type       : 'UI.DataField',
            Value       : PARTNER_GUID.COMPANY_NAME,
            Criticality : Criticality,
            Label       : 'Supplier',
        },
        ImageUrl       : 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/SAP_2011_logo.svg/2560px-SAP_2011_logo.svg.png'
    },

    DataPoint #headerdatapoint : {
        $Type : 'UI.DataPointType',
        Value : GROSS_AMOUNT,
    },

    HeaderFacets               : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.DataPoint#headerdatapoint',
        Label  : 'Gross Amount',
    }, ],

    Facets                     : [
        {
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#FG1',
            Label  : 'PO Details',
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : Items.![@UI.LineItem#poitems],
            Label  : 'Purchase Order Items'
        },
    ],

    FieldGroup #FG1            : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS1,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : NOTE,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME
            }
        ],
    },


});


@cds.odata.valuelist
annotate CatalogService.BusinessPartnerSet with @(UI.Identification : [{
    $Type : 'UI.DataField',
    Value : COMPANY_NAME,
}, ], );


annotate CatalogService.POs with {
    PARTNER_GUID @(
        Common           : {Text : PARTNER_GUID.COMPANY_NAME, },
        valuelist.entity : CatalogService.BusinessPartnerSet
    )
};


//f4 help for po...to show only required column in f4 list table

annotate CatalogService.POs with {
    PO_ID @Common : {ValueList : {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'POs',
        Parameters     : [{
            $Type             : 'Common.ValueListParameterInOut',
            LocalDataProperty : PO_ID,
            ValueListProperty : 'PO_ID'
        }, ],
    }, }
};

//f4 help to show multiple columns in f4 table
annotate CatalogService.POs with {
    LIFECYCLE_STATUS @Common : {ValueList : {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'POs',
        Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : LIFECYCLE_STATUS,
                ValueListProperty : 'LIFECYCLE_STATUS',
            },
            {
                $Type             : 'Common.ValueListParameterOut',
                LocalDataProperty : PO_ID,
                ValueListProperty : 'PO_ID',
            },
        ],
    }, }
};
