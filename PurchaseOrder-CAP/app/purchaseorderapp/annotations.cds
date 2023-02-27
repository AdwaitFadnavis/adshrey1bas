using {CatalogService} from '../../srv/CatalogService';


annotate CatalogService.POs with @(UI : {
    SelectionFields            : [
        PO_ID,
        OVERALL_STATUS,
        LIFECYCLE_STATUS,
        PARTNER_GUID.COMPANY_NAME
    ],

    LineItem                   : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
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
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_ID,
        }
    ],

    HeaderInfo                 : {
        //list report
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        //Object Page
        // Image : 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/SAP_2011_logo.svg/2560px-SAP_2011_logo.svg.png',
        Title          : {$value : {
            $Type : 'UI.DataField',
            Value : PO_ID,
        }},
        Description    : {$value : {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        }, }
    },

    Facets                     : [

    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Purchase Order Details',
        Target : ![@UI.FieldGroup#PODetailsFacet],
    }, ],

    FieldGroup #PODetailsFacet : {
        $Type : 'UI.FieldGroupType',

        Data  : [
            {
                $Type : 'UI.DataField',
                Value : NOTE,
            },
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            }
        ],
    },
}, );

annotate CatalogService.POs with {
    PARTNER_GUID @(
        Common           : {Text : PARTNER_GUID.COMPANY_NAME, },
        ValueList.entity : CatalogService.BusinessPartnerSet
    )
};

annotate CatalogService.PurchaseOrderItems with {
    PRODUCT_GUID @(
        Common           : {Text : PRODUCT_GUID.DESCRIPTION, },
        ValueList.entity : CatalogService.ProductSet
    )
};

@cds.odata.valuelist
annotate CatalogService.BusinessPartnerSet with @(UI.Identification : [{
    $Type : 'UI.DataField',
    Value : COMPANY_NAME,
}]);

@cds.odata.valuelist
annotate CatalogService.ProductSet with @(UI.Identification : [{
    $Type : 'UI.DataField',
    Value : DESCRIPTION,
}]);
